Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747B255820C
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 19:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790190700; cv=pass; b=N+VA07VIHkke8v1JqnQbqgXW44KxxUpW1H2PqLWx2x1zxpkM1OM/dL0v5NmWo7u/kQ1/HpYg1ha5srg9MlyZ7tldVzgi64HawxtjYr1O5AiEm5EhEOotICD3cSsGtsvT2+AoUelRGiwtKUWioHu1OoFb1Vl76jIoxidfE4tUvAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790190700; c=relaxed/simple;
	bh=WyM9Ze+Bhx7ApLDVxVGXqmReVBsZfd8IwGWW1NUKLuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s2Zi//e/yX4LFwo/zz5Er84JAfZHCoPDNq46CO3je0qdjreJRmAh1tkkLMh8LZP+2x5Q6ZMRfrmhmPNtPEL4CAzlH/O7mGI+nSdQJaaux+gXG0FsJxBKqS5CquIdIW8TYaFLAmmaCwybmMx3OjXZVWjHY2FEH8ZzU2qe8iF0ZSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A7SubFMl; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A7SubFMl"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-530e8c6fb80so40071cf.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 12:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790190697; cv=none;
        d=google.com; s=arc-20260327;
        b=AJ3r07IjfwyG1bqNWekWxsb0625ttlEXsC+wZeNlbNjb3rKaP6fhTxXKOxpuaztU8L
         i6svEoRwqmk00KZp9hGEahouTIORBrms4RcHb2smvKJyH/nDpI3H7St5Hj8XegWpqtl+
         Ue+/2J35/E4AsaJ8sfTVWr160xNjnVuElBnm6XZ8mimAgHj9yFxiZbeAjcCrv6tLp613
         fg91ie5HrrtVC3vp/CJhvtyyl28YLX5dKz7+BpPvCJ+mGKdypORnJgjfaJNzkJd98Cpm
         FSFj/fotGY9nS8fJudwixvfddM/bRkraLt0oI53n5WmQVM2tLtd5GCyHFzUT06HD97Se
         iTZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2NQxLZICGnHK2h/s6KW/Zky2T9XW9w9CFC0y7KybVt0=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=HXK7CeI7oEfrs51FzLkzWa42W+Na24UG+9TOSu6WIgHZn2GN0HD5wHUgtbpMfrUYSp
         FKBgwKj+fNOS29wdQo/l5AVMnrS6XbOtQanXl0LT2gAEIQAPEA3b23AGCCsehs5v1DXt
         WLXBZBj2YikD7KJ0grms+SLrzyYCnY/oDz6GOQPsXli4AoeiKH+3031ni0ji0DetqM9U
         vv2JseqMb/I3Ov4QDVavLmqZy6tvs+xNz+OyKK3eEutg0atgtGq/8M7V9hmxob5V/cUH
         LD2jYDdQe06/oiXfp3aL1nho0iwCK4NrmQ2e48OnDjdqnbkJnzfJbqJdFFTY3SDc8wrX
         zO7g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790190697; x=1790795497; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2NQxLZICGnHK2h/s6KW/Zky2T9XW9w9CFC0y7KybVt0=;
        b=A7SubFMl/OD3huOjAT8JgHPfPY1dPSlTaEsCXD5QgHV1g7JwyMahCHEkbpztSVhVCg
         lMPf8k9U4NuUX3zVRNhc6Pds4hPIO2tw1VAi9mtKCO9OJGoNluoPoX28lM9dm+W32YG6
         D0DGW099Q76ZYLFSuEZxuHzTjUjC6KZki/aNNB6gutc/iTRGRAQMeQWgG3ufxrSmdG8f
         QFySeG8nErUG4dyzvggDNyrMggYwsEXMcjNVr5yIAcnAmys5jYZp4fz04h2FjAm2/ZDC
         /mtE//FuquCmeO5EGoKbU/J8M95xoaQ6kpfSXYIS0S7qCNc+Mr7yMgxM8mmzMuC0CgLK
         qhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190697; x=1790795497;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NQxLZICGnHK2h/s6KW/Zky2T9XW9w9CFC0y7KybVt0=;
        b=Cz+Fy+w7y4GoucVyBI+HTGRDIuAnPzlyY02uR9ZfGtAWW7lw1xoKpSSD8SgXxL9bkL
         pTg42Yy2+098AhAxoRkB1vfuFrrGH8o8iDnl6EtUF4Grmqe+Z5CE0HhxBwFWTnGo26sh
         OFVmScaz9JyUOiiJ6GKOfzzrGr/7wpQXgePj5thaFfgu7Sl/O31jWwL24D29gWvf2/7b
         uog7tpuW5XcxfksW3sDDDiUhY+2pjeia3CHWYIFZNKoaHbR+3QZHnSVN/qIgB1yks81Y
         PlkBTT3IWfphoLqpdiXPPLN08jWpvE6xAHF0tvH4Bmz4sf/ESDGVKmLZuiTEiBZE+MS8
         xF6g==
X-Gm-Message-State: AFuF++k92qeCIhF2tvH0MXonoD4oOrGy6dTqpapF70lFUXhPW+PZ8lGr
	hZozQXwRV+faV5kyxuNtwGvrHyv7S9j+oLhwqPnTEcNhJljM8b+h+/BATSUu2hShfBbQDS73Erg
	VgFh8VhZFlE4Y+bIATLUlxAMsMJdi/jC3uIaUVnYIhTOLJchT0iYwEu/YAV0=
X-Gm-Gg: AYBFou04hIv54r/qeN/29qqAutdJ7X+gPUDOMZikKTfPBXcYmOktFIXP/YiR82mSZ8l
	a/qbvqBqPJAFmSQ8+lDcRxUgJJoKHBlvKvkwgiJvEs68J7UgZa76uoLrTLCXt0NPX0q4lVU235g
	MmUztgsvP1FvddthS6lttUuilV0wDkBXtOVX4q3GohGvXv9FCBgUl/gldFhPC7cSAwWrVwQ8kNB
	wRklLk+MNY6f6eZbXzAWSEB7LTPF9M3+nN5WJyoBDmDUubXdlBfvz2rcZ0kluRgqqma0N69eYB3
	kw4yVKPtq/D0WHZAzfkFvOy8oJ5+tYfFEGgA70TE1HrHomGjLufj9eAehslCVfhooOS+BRveDEV
	Tu0pd3Tn380p2CGJlDQ1q
X-Received: by 2002:a05:622a:4d0a:b0:530:e335:4ef with SMTP id
 d75a77b69052e-532f8cb1cb6mr4180531cf.2.1790190696663; Wed, 23 Sep 2026
 12:11:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1789966896.git.irogers@google.com> <20260923181213.3032038-1-irogers@google.com>
 <20260923181213.3032038-49-irogers@google.com> <20260923184942.B756E1F000FF@smtp.kernel.org>
In-Reply-To: <20260923184942.B756E1F000FF@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 23 Sep 2026 12:11:24 -0700
X-Gm-Features: AclHuK9RhfE2VRdiaxPx6w1lQZEg5scq8EUYUuFYW_ImBNRcBFC_bSKcTzZfwJA
Message-ID: <CAP-5=fVakad4+OJSMa2G0ArVXShJ9oi2jKsoNNsL6UvG5NfTxQ@mail.gmail.com>
Subject: Re: [PATCH v3 48/49] perf script: Support standalone scripts and
 remove embedded scripting
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 11:49=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] perf script: TOCTOU race condition in signal handler allows se=
nding signals to recycled PIDs
> --
>
> commit 1ed2e4983f9ede9efdfc6d59669cdd2e466dc05b
> Author: Ian Rogers <irogers@google.com>
> Subject: perf script: Support standalone scripts and remove embedded scri=
pting
>
> This commit refactors perf script to launch standalone scripts directly v=
ia
> fork and execvp, while removing the legacy embedded Perl and Python scrip=
ting
> engines. It updates script discovery to prioritize the system python dire=
ctory
> and updates shell tests to use the new invocation style.
>
> > diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
> > --- a/tools/perf/builtin-script.c
> > +++ b/tools/perf/builtin-script.c
>
> [ ... ]
>
> > +static volatile sig_atomic_t script_child_pid;
> > +
> > +static void forward_script_sig(int sig, siginfo_t *info, void *ucontex=
t __maybe_unused)
> > +{
> > +     /*
> > +      * Terminal-generated signals (Ctrl-C / Ctrl-\) have si_code > 0
> > +      * (SI_KERNEL) and are already delivered by the TTY driver to the
> > +      * entire foreground process group, including the child script.
> > +      * Signals sent directly to the perf process via kill(2) / sigque=
ue(3)
> > +      * have si_code <=3D 0 (SI_USER, SI_QUEUE, etc.) and must be forw=
arded
> > +      * to the child script so it can catch KeyboardInterrupt / SIGTER=
M
> > +      * and flush its output before exiting.
> > +      */
> > +     if (script_child_pid > 0 && (sig =3D=3D SIGTERM || !info || info-=
>si_code <=3D 0))
> > +             kill(script_child_pid, sig);
>
> [Severity: Medium]
> Does this signal handler risk targeting a reused PID?
>
> The script_child_pid variable is not updated atomically with the waitpid(=
)
> call reaping the process, which creates a race window.
>
> If the parent is preempted right after waitpid() returns but before
> script_child_pid is cleared, the system could recycle the PID. This handl=
er
> might then trigger a kill() on an unrelated, newly created process.

In practice this window is small (O(a single instruction)) right
before perf script exits, and it would require both PID
wrap-around/reuse and an external kill() directed at perf's PID during
that boundary.

However, we can eliminate the window completely by waiting with
waitid(P_PID, pid, &info, WEXITED | WNOWAIT) so the child PID remains
unreaped while we clear script_child_pid =3D 0 and restore sigaction,
and then calling waitpid(pid, &status, 0) to reap the zombie. I'm
happy to include that if there is a v4 or as a follow-up cleanup.

Thanks,
Ian

> > +}
>
> [ ... ]
>
> > +             } else { /* parent */
> > +                     int status =3D 0;
> > +
> > +                     script_child_pid =3D pid;
> > +                     sigprocmask(SIG_SETMASK, &old_mask, NULL);
> > +                     while (waitpid(pid, &status, 0) !=3D pid) {
> > +                             if (errno =3D=3D EINTR)
> > +                                     continue;
> > +                             pr_err("failed to wait for script '%s': %=
s\n",
> > +                                    script_name, strerror(errno));
> > +                             err =3D -errno;
> > +                             script_child_pid =3D 0;
> > +                             sigaction(SIGINT, &old_int, NULL);
> > +                             sigaction(SIGQUIT, &old_quit, NULL);
> > +                             sigaction(SIGTERM, &old_term, NULL);
> > +                             goto out;
> > +                     }
> > +                     script_child_pid =3D 0;
>
> [Severity: Medium]
> Is there a way to safely synchronize the clearing of script_child_pid wit=
h the
> reaping of the child process?
>
> The child process is fully reaped as soon as waitpid() successfully retur=
ns
> here in cmd_script().
>
> If the thread is suspended or preempted exactly at this point, script_chi=
ld_pid
> remains set to the old PID while the system is free to reassign that PID.
>
> If a signal like SIGTERM arrives during this window, forward_script_sig()=
 will
> read the stale script_child_pid and send it to the new process holding th=
at PID.
>
> > +                     sigaction(SIGINT, &old_int, NULL);
> > +                     sigaction(SIGQUIT, &old_quit, NULL);
> > +                     sigaction(SIGTERM, &old_term, NULL);
> > +                     if (WIFEXITED(status))
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923181213.30=
32038-1-irogers@google.com?part=3D48
