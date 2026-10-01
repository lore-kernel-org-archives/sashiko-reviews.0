Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743E4305666
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 22:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790892163; cv=pass; b=TJL7RWscsHEkaTEHbOJ/aVSEcBXFG3qx+UUhkrS8Z4nTRkBrGThBzldyNDpcG++2MU2gynZQM/4rL/uflQQYWc2oLCF6epBuRSv7oWQGM7ATDJn7JVxh/lYUi7QZp3r0cN3f6rPwe1Nl7FTJTp711fKiOuvB7hj8JJTkN2v17QE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790892163; c=relaxed/simple;
	bh=/dIIozle01F2TP5UAfP90kLzrnuXniZTjSv6hVrVNdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQVi+BmzUE/3l1NHF0ZjwLquZMpS7+8xiXM2su+bhVtjKW/PSVOhrNk6S7t1o1wTCVn6Rx8P67WYhZnz4eJ1pIifpgv3wpBkCcI6K385O1VAvg7OCEeAwM2M3UWKR+9oMgcA5Cu+i3duFvGKav3CkG3shF2tqQIHSxI35YWvN0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAWkaVvZ; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAWkaVvZ"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66f7a9afe43so6171307d50.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 15:02:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790892161; cv=none;
        d=google.com; s=arc-20260327;
        b=OjAPN6Dd7Lb8kN/3c4nW26YJT8MrgrBRY8l/0ZEfOJco0m+PVMQwjLkpO7lhO5QDQJ
         vCNWQ2ozYGV/OLG1eKVYy9+c2naTye/+gv9Ihkxdg1TNCHX/Ra5Hhlwfz04sGWhtu8UT
         P6zQEZ7LZ7mJvB4Ee5AQxnWUXaOtLElp2bmWF7JQF4VYLlN2Wsc2KvJGcos9Qhp8iqcm
         AjUjJQR4ISRPy8r2pnVZ2sgQ7ovolxqTec2QZ3wqF8S+GQtomaKUmfISeZjHZDfKZEVK
         hw5xt/Qne9JEpNDkVoez7GB1XYs0TLoz5ApH9P2aIiV7+/u44NhCaZluNyir/+gFaL40
         Oqqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fqM5uspbbFzV6bdXwPQ6MVvrUI0lCblX7jHB4nRMB9U=;
        fh=5cs6b6d7Xpq2ANmcE1sW6J73OLOoOdfaXy4E0BsYxz0=;
        b=ElqcUpGHRRE7x8cBkHj5NUhoIrYiPDWDp0Gk4O3WMH6jc8ZDEmEuTJnZYpXaWuvlbu
         nX2h8tlfWNFiG7liD3SNU13Kymv0q98qbdPkKm9rddwgMpwwNg8JGkVIZPnyPNK3szff
         WeEUjLqzVyppTWmqWzK8H0+spi6buX7TWYAON7+fBH990esO933S8IIY15TgbKXU9+ns
         9zY3YwSaEy228JEaMc1kOz4F9sQGaupVSb9Vs/PidH+McDJr11bJ8KK57zpce2RdeUCg
         19jENfA6NNC0CSpuv+EvL+nEwzTUkuAqqzuF2qUsNXyosNal+opsEGfrIn/Fa4c8HB6O
         gA6w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790892161; x=1791496961; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fqM5uspbbFzV6bdXwPQ6MVvrUI0lCblX7jHB4nRMB9U=;
        b=EAWkaVvZScR2y8oS4g2QZnGErbqEY/l3T2FP5d0O3j1242L6mkR8T01screBifu3c2
         4Zt8F1cTVR4ALCdjv57RgVaK+6UG1ba5H1p2oQwIMQsGPbXfdTyJXNzoeVnTIc5DX2aD
         wyOlg7QF7LbFukdzIr0BHrajPPAqmAzvjRWq1Cnn6WrkdRdADrcf2v4E566pr5UY1KOH
         ncb8KOimFleMVA42Sp7eB/C2S3p++AJcKcK4dk4wcJ0Hya/edohGvzMrIxxfRnn5Wi7J
         5g30/fT+hRFmyqCLG0CO5yIyT7tugeQbSuCKo4qGpf25J6F+zveSGIoihaHumngzh0d6
         jcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790892161; x=1791496961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqM5uspbbFzV6bdXwPQ6MVvrUI0lCblX7jHB4nRMB9U=;
        b=0rIpwwrkF8y9oxLLI/TsQiPHRXy43BwodeigpitmR8mrJk+IJkKh+x9WXvgRiurjFb
         4YkoPcXLrL7SI2/oJv+rnKmIa7LPiu+yEAEV+tKCeTuHwTpKcIldgCFkMrsgrGDNat7A
         740Jrk4yDhRwlk6I4/VyBE6bk9dmqPNBYg4GaY/vM0CMwCXDnV+TYE1jqAiA/zgNtHay
         YHwtC7Ncpc3tyvS/j+ii/11TRw0XheA3mz0zNeSfNwV9vbofY/kVxgLHCV7RqDKSzta/
         PyNAAtAIdVm73AUrRSBVsOqFuAod+7+tgvSBbteDZd0pSittiAivBviMeDg2tNgIre0i
         zQQw==
X-Gm-Message-State: AFq9FYL/TkzRmzVG2l2tkZ/otmRdswW0PXy5fPp1zLmS+Vnf46Kju/iS
	zHQBZwhCOvkQFbZsoaYnOSACxKVpeCsuXpF/r5oBxY5kG4ynlbCB9ZxTaQGRlbpwi7iR4JLYLx8
	Svl3DnXRndDD4Hn0AqcP5vBp9KLC100GipWQV
X-Gm-Gg: AYBFou2/jClOhmiU/MzehAk87RpLcC79yutLWVmbi4zOfwBOyCSHq2pH9x80GFG06wJ
	fqnmjnHZOl/nypsUHkwYvQB+cQ864NVpbjOWnoNIchbml3xPlwO1/lDYaXI0yr5xu9JW08GQmI4
	XfnxcFxPWYMTX1h64Dqzaka4PemmavN8K5O7ENlcXJfV0Q+xkjmXUp3IcIiVidN1WyiMbKP/M/a
	v1A3pGAZqasqKm2HE7tWgZz9E3kJc3Z60RkJcdMMHUHoVMr0PExjA+mxvcIvd6cjugRFitTS5Ye
	SCQBkC9Vez7JRotud0WvgT1mc/5Bi0rnL2NpSaatsIUR1DJYifacp+tkktQAjdvEsA4ggaG200H
	KwW9zTAwz/cv58aVWmzHwWwbm0Ubb0t0FWQ==
X-Received: by 2002:a05:690e:438d:b0:671:1bbe:f68c with SMTP id
 956f58d0204a3-677ac03e975mr192565d50.51.1790892161398; Thu, 01 Oct 2026
 15:02:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
 <20260923-dd-cmap-part2-clean-v11-29-9b6c217fdf2f@gmail.com> <20260923224657.3F5C71F000FF@smtp.kernel.org>
In-Reply-To: <20260923224657.3F5C71F000FF@smtp.kernel.org>
From: jim.cromie@gmail.com
Date: Thu, 1 Oct 2026 16:02:14 -0600
X-Gm-Features: AclHuK8ODmvd4WyPoy9OINszBNVr-POspB9wdJcmt3RssLX_jouSGEmCCu5Ssb0
Message-ID: <CAJfuBxwYku+xUmWVG2-BhqKCeb=-=B6d9cdOJ9vf73NtBq=sdA@mail.gmail.com>
Subject: Re: [PATCH v11 29/38] dyndbg: control-parser: treat comma as a token separator
To: sashiko-reviews@lists.linux.dev
Cc: linux-modules@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 4:46=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] dyndbg: UAPI break for unquoted commas in queries
> --
>
> commit 3647cd55c26b2f7588078b414e3120a9276258a8
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> dyndbg: control-parser: treat comma as a token separator
>
> This commit updates the dynamic debug control parser to treat commas as
> token separators alongside spaces and tabs. This is intended to allow use=
rs
> to avoid shell quoting issues by substituting spaces with commas.
>
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index 8eef2e7387a98..6482fd28def46 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> [ ... ]
> > @@ -336,8 +344,8 @@ static int ddebug_tokenize(char *buf, char *words[]=
, int maxwords)
> >       while (*buf) {
> >               char *end;
> >
> > -             /* Skip leading whitespace */
> > -             buf =3D skip_spaces(buf);
> > +             /* Skip leading whitespace and comma */
> > +             buf =3D skip_spaces_and_commas(buf);
>
> [Severity: High]
> Does this introduce a UAPI regression for existing unquoted queries that
> contain commas?
>
> For example, if a user currently submits a query like "format a,b +p" via
> the debugfs interface, the parser would previously see three tokens: "for=
mat",
> "a,b", and "+p".
>
> With commas treated as separators here and in the loop below, wouldn't th=
is
> result in four disconnected tokens: "format", "a", "b", and "+p"?
>

Treating comma as a lexical delimiter alongside space and tab is an
intentional grammar extension, explicitly documented in
Documentation/admin-guide/dynamic-debug-howto.rst:

0. Comma separation exists specifically to solve shell and command-line
   quoting friction in space-hostile contexts (boot command lines and
   modprobe args like "modprobe drm dyndbg=3Dclass,DRM_UT_CORE,+p").

1. The dynamic debug grammar rule is uniform: any argument containing a
   lexical delimiter must be quoted. Spaces inside format strings have
   always required quotes (e.g. format "foo bar" +p). Because commas are
   now full token terminators, commas inside format arguments must also
   be quoted (e.g. format "a,b" +p).

and the user is free to add the quotes if literal "a,b" is what they wanted=
.
    #> echo format "a,b" +p >control



> >               if (!*buf)
> >                       break;  /* oh, it was trailing whitespace */
> >               if (*buf =3D=3D '#')
> > @@ -353,7 +361,7 @@ static int ddebug_tokenize(char *buf, char *words[]=
, int maxwords)
> >                               return -EINVAL; /* unclosed quote */
> >                       }
> >               } else {
> > -                     for (end =3D buf; *end && !isspace(*end); end++)
> > +                     for (end =3D buf; *end && !isspace(*end) && *end =
!=3D ','; end++)
> >                               ;
>
> [Severity: High]
> Because the parser now explicitly stops at commas within an unquoted stri=
ng,
> existing queries containing unquoted commas will be split.
>
> Since ddebug_parse_query() expects an even number of match-spec tokens
> (checking nwords % 2 !=3D 0), won't it fail and print "expecting pairs of
> match-spec <value>"?
>
> This would break automated scripts or user commands that pass unquoted
> commas in their match arguments. Is there a way to support commas as
> separators without breaking existing unquoted comma usage?

again, if theyre looking for "a,b", then they should quote it.
just like if they were looking for "a b"

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-dd-cmap-=
part2-clean-v11-0-9b6c217fdf2f@gmail.com?part=3D29
