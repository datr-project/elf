% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%                                                                           %
% File:            uses/Debug.pl                                            %
% Purpose:         tracing DATR evaluation                                  %
% Author:          Eric Kow                                                 %
%                                                                           %
% Copyright (c) Universities of Sussex and Brighton 2014.                   %
% All rights reserved.                                                      %
%                                                                           %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

% `Debug:<trace path...>` is meant to work as functionally
% a drop-in replacement for `path...`, except that it also
% prints it out to stderr.
% This can be useful if you want to avoid recomputing
% the local path (for example, if it's stateful and you want
% to avoid changing the meaning of the code)
'Debug'([trace|P], GN, GP, P) :- !, 'Debug'([writeline|P], GN, GP, []).

% `Debug:<tracemsg msg path...>` is meant to work as functionally
% a drop-in replacement for `path...`, except that it also
% prints it (and a messageg) out to stderr.
% This can be useful if you want to avoid recomputing
% the local path (for example, if it's stateful and you want
% to avoid changing the meaning of the code)
'Debug'([tracemsg, Msg|P], GN, GP, P) :- !, 'Debug'([writeline, Msg|P], GN, GP, []).


% `Debug:<writeline>` sends its output to stderr, so that you can
% avoid confusing it up with any actual output you may want to
% produce
'Debug'([writeline|P], GN, GP, []) :- !,
     with_output_to(user_error, 'System'([writeline|P], GN, GP, [])).
