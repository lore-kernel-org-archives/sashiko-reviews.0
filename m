Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03980423E98
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 06:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790316873; cv=pass; b=shvogQFmXBKwa7WRXl6FDhk+jEoizyAmhZ+/FRj47BcdVZPawXb+c/TVI14Ogi7TxZe8rt4+HeZEFUZ+WQ3GArbTMSFXKC9ZQ1xG6XmZp5Qxaf1mkB4QaP44OUv4qVEJ1TDg/cdBnKe8nfnGBWAsguFuEpcNiKKzbYtZex/uGxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790316873; c=relaxed/simple;
	bh=JlGysplpVALjv18/KlcGZlhOgXUIzAYIQP16XTyqrE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uswERjJSrQUTT3qU9+b29R2rVQyXqGJuEmqANOaGBc+WLFdyP67ip1rv777ytAhA0VOhmVeKG0om9cLhIaRGpxkhwr4yTLaYnUJDLMPe9MwnMqtyzMU49lFwBpQXmPdbnvnqeZ/sBRmcPpr1JBTA6BvodD1dXrDmNK5jNGgBfBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZU5IPvI; arc=pass smtp.client-ip=74.125.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZU5IPvI"
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-49fe8bf90c9so1403075e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 23:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790316869; cv=none;
        d=google.com; s=arc-20260327;
        b=ea/qMVAh65dA5t6JcuIBt6wO/ekX7xeZpJkY/JqdAW/TVKvErIEP1ePIwhamWZJ0Ap
         dOI9lVcKe3L1VBcEJtBSycvmSIVqqHp+hovP3Z53Jl363MUrF+hAX3f5sd7XBRd+d6RN
         Z77xVBTqBDbcmZ6rW5RP1qcH3FE2z2A9iA17pbM39wMGhgkCq7JjU80M1yY6dh+zvDe+
         8/pmj8H+b4i1YXUejHr7ff9Nu66bX0hhFBPz8r0CY8JWg0HCt7OW7wVRmAhSf4DTUhSJ
         Qk51nnnVoZlvoRB5Wr3vDoaQ9hRZUUXgiQ9bv7AdRjMdgIcKKmMnonc5zOMRHEUHQoi7
         M2cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kpy0bL3ouzGmOCneXp2v4HxEUP6xDOQAy2AwC7Iy5DI=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=Rm2tIk3BYtXzD0OAJav4RyjWxFPFUFbmKWiNvBFX8Ab3PqSV+qnjUbCzaa2JsOH1L2
         GX3wC5rOKCLfcPCXtqzvT0qfxqCJ6PZa4mNh7hm4WzozWG/nY9OVoOPJXSy3jfIMsbbd
         Nivm/Dayr6olt3Rhz0y62htWiu7URmq79ygj0QNdazj6bzqP+UWiv5YIOBgcMJtsU3ka
         D1RGvFSletK2yBLXCROfGC5FWhs9s5OL5lMG6bLir/J+XLjUUQNBiVo37gI5UV1626uM
         ZUA3+pXJvmYDXhQDxiXPR/pnh43FCqXDHV8KQkPL2VSEX+7m1iEA6ombl9CJKM54CsNx
         I6ZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790316869; x=1790921669; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kpy0bL3ouzGmOCneXp2v4HxEUP6xDOQAy2AwC7Iy5DI=;
        b=JZU5IPvIGOfMKLv6z8RXQXbFZRA9t0YD5z2IOTN/0R+dTa9ZqVqfUQBBROrHgOglK+
         TxqOtci1xYe3xUP3DMXdGqsnXPq0rfbGF0lzrI82X0oz0VO7KsPkaIVtBANKPV1wII6J
         7nlhFRkBzKT0ZfyeNAL7b/nZmKWCZSYSe4yrsLuPEr/FXVc9rodxKSkk7H0lm9y0zvRZ
         WwslimaOclrnBzX0waV9+XtEIgJJepj3LnuG8Y3Br7EuBvzE+NBf1AQqn+62a1CKjweW
         9lU86OChKfuJwIDOoOTqObGLmVyLChRH5evZLepCiOOgzbZWQvwmTEx/TQX2KUvN3gLh
         sWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790316869; x=1790921669;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpy0bL3ouzGmOCneXp2v4HxEUP6xDOQAy2AwC7Iy5DI=;
        b=FsWhr89x4eCYx8lpUBZXlC0wFmX7ovcJ5UcQAkM+I7vEytoOZ3L1TNDt/lRtNL4+3e
         L/0p7kQ75FES4IEcYNyXyGX+3uRBldCpyFgCq1xQV4+bWZkelV5OKUkX4eMGyxxGpctL
         WHbP7BPjZYVsjWdBS4uNs0EprJVdjnIMv5AIvvRZTl9hqAsVuKkc3VbSp1dJ/NaUkWwy
         NFdi3Glqz50umIUgH7kfutGjI5Vl+TDRvwHPSSAojX9w6eyeUOYLshoqhMBy8bsd5GRV
         v+SpmRempdeHSJx9TJgNB/StcB/v4RN/k597lgJhUtEseSSlvQQewGzvfRYjKRhGwBts
         8chg==
X-Gm-Message-State: AFuF++lJYeveAaeFNamxYnB62OOadSxfdgODQEJDpxHUeYBXTMVFZn7e
	qPr9W8naJ0bqV/ZrXCFKebYuXt4gfvQM24b2fNJ4IqBxtOps2oWeji5uls3tWUg5ejM3VYHbD+1
	aJV+OC68Ocph4Vp/qCltD5GYygEe92ZfOgJXHL7yOcg==
X-Gm-Gg: AYBFou2yQQSjT2jmpwTjHAGArcKUkyLWuan0+53MHtvwBN1a5FImEhy0BzKoepDIJ8j
	8rocL1ihxJY21ZbTzRybhTJvgv+Zj8Vjnsk0Y6P27qh1YigCmty9bPKL525Yyna5GD8WHUeYQ/u
	IkO8s+A/iu81VzZxNLDL5hpFimQvgZOlt3GlySLk05x8Fvs4aip9BnYzYlScfJUwo25wR6nU9d2
	PaHU5dCvZbhlM0PV/+q1UznkE/uSQokg9yT7T+PhLqjuHkmFK2xo7RSV+UgMNkwpOzawQhtS1op
	5cmMUDlzJPnr6gTLYefP2tb2l28EWCBTESfMVo1WeqmVKvJqgX0NlL/7KCwk59xcA2otukDDBPe
	DDRjFYv38+HFGhFF/VqR26OHe7glRaDdFvRfZKW9pWzcYHd1x3ocETZOlQaTyHSMamqK0LZQKUf
	EVTTpH11g5kpDb2pevKQ3Xt2S4LztfT4w=
X-Received: by 2002:a05:600c:4e93:b0:49d:243a:e4f9 with SMTP id
 5b1f17b1804b1-49fe66d0727mr84798475e9.10.1790316868920; Thu, 24 Sep 2026
 23:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260925045536.1480933-1-memxor@gmail.com> <20260925045536.1480933-5-memxor@gmail.com>
 <20260925051521.7D8D41F000FF@smtp.kernel.org>
In-Reply-To: <20260925051521.7D8D41F000FF@smtp.kernel.org>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 25 Sep 2026 08:13:52 +0200
X-Gm-Features: AclHuK94nvyqfIYrKXMpv1Xd0dtsNyekIW1K-mTnoDv2pYhwLIt_jTAb_ghR3iY
Message-ID: <CAP01T76-E4O2jFtWZ+rz0O0gHoiCb4daE=kLkPFNeobaj1FbSA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 4/5] bpftool: Add option to wait for program
 stream output
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Sept 2026 at 07:15, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] bpf: bpftool deadlock in exit_stream signal handler
> --
>
> commit 482ed48b5d6910c6aec52e854a7926f6f16ce58a
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpftool: Add option to wait for program stream output
>
> bpftool prog tracelog { stdout | stderr } PROG dumps the output buffered
> in a program stream and exits, which is all BPF_PROG_STREAM_READ_BY_FD
> allows. Waiting for further output means rerunning the command.
>
> > diff --git a/tools/bpf/bpftool/prog.c b/tools/bpf/bpftool/prog.c
> > index 24e40dfab4690..5e27b22444f25 100644
> > --- a/tools/bpf/bpftool/prog.c
> > +++ b/tools/bpf/bpftool/prog.c
> > @@ -1119,21 +1119,66 @@ enum prog_tracelog_mode {
> >       TRACE_STDERR,
> >  };
> >
> > +static void exit_stream(int signo)
> > +{
> > +     exit(0);
> > +}
> > +
>
> [Severity: Medium]
> Since exit_stream() is used as a signal handler for SIGINT, SIGHUP, and
> SIGTERM, is it safe to call exit(0) here?
>
> exit() is not async-signal-safe and attempts to flush open stdio streams.
> If the signal interrupts the main loop in prog_tracelog_stream() while it
> is executing fwrite() or fflush(), it could try to acquire the same
> non-reentrant lock, resulting in a deadlock.
>
> Could _exit(0) be used instead to avoid this deadlock?
>

I can follow up separately, otherwise include in the next respin if
that becomes necessary.

> [ ... ]
>
> > +     /*
> > +      * Exit from the handler like the trace pipe variant does. A flag=
 checked
> > +      * between reads would miss a signal that lands before read() blo=
cks and
> > +      * only end the loop at the next print.
> > +      */
> > +     for (i =3D 0; i < ARRAY_SIZE(signals); i++)
> > +             sigaction(signals[i], &act, NULL);
> > +     while ((ret =3D read(fd, buf, sizeof(buf))) > 0) {
> > +             fwrite(buf, sizeof(buf[0]), ret, file);
> > +             fflush(file);
> > +     }
> > +     if (ret < 0)
> > +             p_err("failed to read stream: %s", strerror(errno));
> > +     close(fd);
> > +out:
> >       fflush(file);
> >       return ret ? -1 : 0;
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925045536.14=
80933-1-memxor@gmail.com?part=3D4
