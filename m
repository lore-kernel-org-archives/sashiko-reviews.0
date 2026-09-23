Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968F954B1C6
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 19:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790190533; cv=pass; b=Mwnbbc1dCZNRmvx7VyM/tRdiWDhbbR8aLU9rwtZrhGvY0Hs5Kgg8asNex/mXJ2WRbZF/a1lfCTYCUygqJ7oFLn0cpJNplOzmONShzhNhh1gLImWRGyN3o6YKsg00LIk/AobF30s48xfzgYBP7T+JCetxlZqtVYTTQ6792AdrjOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790190533; c=relaxed/simple;
	bh=5LZM8d3innRBAzNLNsGi5lkZyJzPm9PE6/1I2v46ll8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ToHg3IPtUePMHCxriZj7yfMrRWErGBwV7M9jVploFCPpZmAK1skR+iiFhB1V6kW4yX7aIiFqIG8GlXJSpGdPfZY9pt1GMTqFvKhoC2qO38lklqnZh56uucNISq/GBteoLWtVgtBBY3Kc/MR/HWdBvlLS3uBI4K/9pUcEBsgKNCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zc5ybZrJ; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zc5ybZrJ"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-143490b97f7so2745c88.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 12:08:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790190531; cv=none;
        d=google.com; s=arc-20260327;
        b=s9vTd51MfX43xkrHc0y2omVM2mJffzgaW9cU8Hh9O+xlvnVZVL1UqS11ctjZvNVos8
         kb3MISEoYMb366YYqVNOb8nuNTlWkSlQHCRxYeqDxY8qiBw49uCM4Maaxy/G/QdyLb7+
         QaQ82RQEeJAauMEK7es1zYQX7SUnauXJPijNL2WKt3lsaN1ryOLXHdmH2y7X2yJz+nPW
         S5//kmsPa2x2JOqdMIZEyY8MZH4iWuLrSc8Z7CPcsL4rqqsg4Djcp/kDOZwZjYsklrrr
         XQUZKuE2FPvtiuwbNtzjKlEZOvzL8jsHZ3RfoYWj7cQ3X3ms73Nb7/Gobm8A57xfE8XJ
         X5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W0FYu+dVDEzIdn773qfkDF08ZIKjJFXLHOFX+/IEE1M=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=hp3g2eVBq6HnChFlJBnaLcpDJle+eYtZ9ZE5KrWKyBpTeSkvvlo0TPtE6sydOwG8dI
         YyQCcsB409f/koZAF/Gz3O+L1DRBMBSBQIgYncwwprNhYvLnX4qeSWQ9W3y17iu6wLGd
         JdXvavchn0Nu8xSec1UFxuQJEfDySlyukMbIjorX97qgXHO7+kSI9eF8XfhbpedZcvoM
         b5E6e/S8paq5mnYzrdXIE4pooQur4w81nOvZGX7sXDSXNoolfZYbdrFNELSW6sL7dQiL
         BggxFNDyIBcs96sTY8AC5Lhhxvebw3YnEI3b64SHVsMSl9pQPtHvcT6VmdNaouFT9iqk
         oTdQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790190531; x=1790795331; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W0FYu+dVDEzIdn773qfkDF08ZIKjJFXLHOFX+/IEE1M=;
        b=Zc5ybZrJwYGQhmL5CKcd2rk4gPRRHUhlfFRoJhStyziad9Ece0hZvE7BiVd/Wp6MQy
         H8prBK+BofyOE90eobHpzgrLb8NDkTXocOKWZ2UsLWQjLfTnq+aGA3Hrli/z7HvPiTfJ
         KrY5LAXYBNQJv6F0wbwm440wQyWKq+fqt7n6mqhWp76kKi9Az6KjMwq3ApklQZ8oHc4T
         tnJBOA9wE1oAp3Rl75Sx1Bky8T3u5hCMzwcTabAp9euwqv636YFTCCJZAc4QQPDMi37G
         jwXEUnefvW3Ax8ff+QXkSa2EAL2H1Jz3o7VPmAoMKJ3bxZcS2V5yfDSD0rW7lhNCmldV
         Pr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190531; x=1790795331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0FYu+dVDEzIdn773qfkDF08ZIKjJFXLHOFX+/IEE1M=;
        b=Mg5ydmwwf7AGoJodZnJC9RsZYXdQKrDlBg+YTPkWtDdr9Y6YCIjEfe7nghv3HeYV8/
         hZqKP8oKYBer8XB5sz82zPCMksFaaREzOsxz+IByCo2tZHVVm38S6ofIdQC4bg+PmT89
         ONCDX7egBUnvvHG4jF07XD6ZthCoOo8doFowrvdKdBjgqyL9e5g0J8rdkTJ0pVhAfjrv
         sGQl+UAD86mVOBemrl2BleHVjpLXYkR3Zi8iE127J4QFBPSHl6IPgrXsb2GLJw8fGc/C
         5hmQYiE8PtJyjJjtCZRL8PuY486CdWnAAISdYjRRkJQb9mSnyKhBSUqlxCjCMBq6J2xc
         5xyw==
X-Gm-Message-State: AFuF++mIxz+CiePhFfX/LESSzfPGQesunRwhloyzY/OIGUudrOvUomM2
	HWynTXMLfGH7SiF7ciHXCApyrZA4tOLGyKO873Ojnxh9/NTYdpCOpaX469+Jq/PvMYBva/ss4Qn
	jUF8y4RPc+uaCqnRlWAMBDRW1w+otoqMaI18Z6ME+2c6Q6e7facfxcFh7mhQ=
X-Gm-Gg: AYBFou3QpavoM0xeSILiWnXEJOuRkkuaT5HiO3F/pra83COTcKfj4hcOitwOqp+aXnK
	1PX7YaUN5VKtL0pa3/nPlz1JXLpv5rtHzlSVQS7rdyo2Y8xklRCRgzh3NKygH+qZM2JBWoQjEyF
	UcGWx7NQzacDhRt+f/taeLIOnzb0/o8SdJqxMIKGnykQcUQYl6B6B7tg61wfr0ZlzxRkB93HRAE
	EwU9uKC4W5OzCtCa7uvnj7nS7KCBLTYPtkf+pERvYzndZORliQxhKuCVcgWirE1vVJdMKPCzwWC
	w+4BLk7kqjjB0FgMzo03uQ2YxnMUe0D4Is744u3Du33GhaF1Xgp8w2eK5Rlp/6fTCb/CWNNI2vQ
	VVzftv65cVR6JUBViiwk9
X-Received: by 2002:a05:701b:42c8:20b0:141:5392:d9c2 with SMTP id
 a92af1059eb24-1450301047fmr155852c88.8.1790190529723; Wed, 23 Sep 2026
 12:08:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1789966896.git.irogers@google.com> <20260923181213.3032038-1-irogers@google.com>
 <20260923181213.3032038-27-irogers@google.com> <20260923183554.0FA3D1F00898@smtp.kernel.org>
In-Reply-To: <20260923183554.0FA3D1F00898@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 23 Sep 2026 12:08:38 -0700
X-Gm-Features: AclHuK8qhCEYQ9mG1gZ1SW8-VAFZWaY6mM26YdNCosFzZd3023TzFpnigkApBYQ
Message-ID: <CAP-5=fVZ1Czc+C-_2CYWqMo=TRJ+w9BR_s8=JTqwiztDLCo8aw@mail.gmail.com>
Subject: Re: [PATCH v3 26/49] perf python: Port sctop to perf module
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 11:35=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] perf python: sctop silently drops legacy syscalls:sys_enter ev=
ents
> --
>
> commit d8ecc80e7d73cc2057e5019382b002550902b4ce
> Author: Ian Rogers <irogers@google.com>
>
> perf python: Port sctop to perf module
>
> This commit ports the sctop.py script to a standalone script in
> tools/perf/python/ using an SCTopAnalyzer class structure. It adds suppor=
t for
> both offline analysis and live monitoring, resolves architecture-aware sy=
scall
> names, and replaces unsafe signal mutation and subshell spawning with
> threading locks and ANSI escape sequences.
>
> > diff --git a/tools/perf/python/sctop.py b/tools/perf/python/sctop.py
> > new file mode 100755
> > index 0000000000000..fb709206993a1
> > --- /dev/null
> > +++ b/tools/perf/python/sctop.py
> [ ... ]
> > +    def process_event(self, sample: perf.sample_event) -> None:
> > +        """Collect syscall events."""
> > +        if not self.offline and sample.sample_pid =3D=3D self.own_pid:
> > +            return
> > +
> > +        name =3D str(sample.evsel)
> > +        # raw_syscalls:sys_enter exposes the syscall number as 'id', w=
hereas
> > +        # per-syscall syscalls:sys_enter_* tracepoints expose '__sysca=
ll_nr' (or 'nr')
> > +        # and may have an unrelated syscall argument named 'id'.
> > +        if name.startswith("evsel(raw_syscalls:sys_enter"):
> > +            syscall_id =3D getattr(sample, "id", -1)
> > +        elif name.startswith("evsel(syscalls:sys_enter"):
> > +            syscall_id =3D getattr(sample, "__syscall_nr", -1)
> > +            if not (0 <=3D (syscall_id & ~0x40000000) <=3D 0xffff):
> > +                syscall_id =3D getattr(sample, "nr", -1)
>
> [Severity: Medium]
> Will this silently drop legacy syscalls:sys_enter events?
>
> When processing an event named evsel(syscalls:sys_enter), it matches this
> elif block intended for per-syscall tracepoints like
> syscalls:sys_enter_openat. This path expects the syscall number in
> __syscall_nr or nr.
>
> However, the legacy syscalls:sys_enter tracepoint (used by older kernels
> like RHEL6) stores its syscall number precisely in the id field. Since th=
is
> block avoids fetching id, syscall_id will evaluate to -1, causing the
> script to silently drop the event and report empty totals.
>
> Could the prefix match be updated to distinguish the legacy tracepoint fr=
om
> the per-syscall variants, so we don't drop events from older perf.data
> files?

So syscalls:sys_enter was renamed to raw_syscalls:sys_enter in Linux
2.6.35 (commit 308fd7dd9151), and sctop in live mode records
raw_syscalls:sys_enter. It seems unlikely that supporting pre-Linux
2.6.35 is a real concern.

That said, distinguishing per-syscall syscalls:sys_enter_* (with the
trailing underscore) from bare syscalls:sys_enter is straightforward =E2=80=
=94
checking name.startswith("evsel(syscalls:sys_enter_") first and
falling back to sample.id for raw_syscalls:sys_enter /
syscalls:sys_enter handles pre-2.6.35 perf.data files as well. I can
fold that into v4 if needed, or send it as a small follow-up patch.

Thanks,
Ian

> > +        else:
> > +            syscall_id =3D -1
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923181213.30=
32038-1-irogers@google.com?part=3D26
