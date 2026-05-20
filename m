Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF2C2C11CB
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 05:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779255955; cv=pass; b=rXy3IwcRAvLEnZf5L7mzfEO7oR2EIyLhrHH+fASdc/H0Ez+Dj8TsHH2+LZwIVvT/SXjxvRiwrktm7sw/8GTE+IemrNZ2eoA1l6GhNOZO3UcHHxbUgccTax8LeNwUgbvRKNOUhiJDK/Q+c3M3u1YwqjP3m+QjhndIyR3OWjYeW64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779255955; c=relaxed/simple;
	bh=5+A2cMn35lMr5zwvT+VL68ElxZGgIpviyt8vFcKjk8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LGMioNrB5QXOP67csvHydLeqxnF99qGcauRQK4wNVOLFzZgKvJHLVaRG7bnRfc8prMMs7ycvbULGnR+P3KJFyPGG+9fNyBKNlAJgIIXzhAgLyqxZVMKZw64a9/AIXbVakng1z943IJ1M8rr8GDdwWG/LcIpUTQuXsReVaJRiAaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8XSYFWe; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8XSYFWe"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bcc2b199c17so583611266b.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 22:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779255952; cv=none;
        d=google.com; s=arc-20240605;
        b=DCH1VfoduCyZGCrPffxJ1BjEU3or+oyfOEVjHMczAljQqYtCJ0mkbZRZNHKOEY3Xpt
         iWoNBQWXvOxcM4FVRJyzfkpyIsvXU+hHwF/iJS3NJFYMfdaJTLzyRWtPV2AG8V7S8WBC
         fgAbnv600822hjl4zbqUyasqI4Std7v0xVF7iOGLr1cS49kPdt3ZBjwWTn2MIsv7e3p5
         6ZSlXrt7cCqrQClBgu9AikduFnpduBkd0TfIg7jcr92uWyMPB/gPnwWaYZpAMePVoSvw
         +7nqovzbBLcFU3CNd9e2NMYlXZU/qftHYPNcZzQrD7TfIRSk92dwSYe2D3tti0GsrsDB
         OkYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L7xIz3gLUx337iHMZn9kR2NfXnQ7+wf5o2+izT401Pw=;
        fh=ouXvSjf5SmEmNeimx6xyG+CKjdQvC3UxbsGBNR8v92o=;
        b=MK/g+ljrg7p8cthaNa9kOYz0kSIQyASPls4xUVTn0mpg59U+UMKVvyv5MA+87eDO2k
         n77kp0K24QO2rIiFs1i3tqLA0worXlWNCDqq2je2nuIKBv8paBy/6tkwBkECNQdqejGX
         aM61EQJuHtlf2RH45c74zcSlFKGRcJdYec4YAJQ/9V7S1mVKod2E+w2XGxIp/OC0OeNa
         nN0Q7YJQFIHYUabLn50DiJgZACPDMVBLxnkM2BgjjbkKv9KOjgPZT4ctW4V/bj1sREbF
         ZKzMdNGnVVG/xw2jYcAhK7HzT3eVSE2/p0J5vVRZV/l4o8FCfXdeogjZK7zxmvH7weMV
         lIPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779255952; x=1779860752; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7xIz3gLUx337iHMZn9kR2NfXnQ7+wf5o2+izT401Pw=;
        b=k8XSYFWeoxlc25ps3ybV3u3eqJfLGyi4s7VSelcu47oe685PiKQM5TM8nunSm2pL1p
         /KhPGZ7XW20/DT9bSMv+VFyJYVViU+0izWH0JnxU0eyiqJpzlDGKZRNlO5a3dzt3gjj0
         ZmhhuMpbNU4+boEm8bNw+zeq9k5wFD+zdGU30S7Oyy4CnyWI2PyedjQg5uIUX4PaTsg/
         U97eRZsS6UX3KToNQ7nOOu2qHljoQVViuUuFgSdYshB4Yvs/275Pa0echAkqHUAfbhhU
         tANhgAx9BQ8qE4tu+iFgrM+9NECgk2gcHtwl5V6MQJtkEYXUvDNUvrWryLq2HBL3zdNp
         PQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779255952; x=1779860752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L7xIz3gLUx337iHMZn9kR2NfXnQ7+wf5o2+izT401Pw=;
        b=h/nHPmfNkTTZxPnq+B+1OyL3v/zqL8cSGfCFOliC8qROHEmFnUIArfXEX+KbqYuVsI
         6sEPP0805y8uHWwrHia/OyqFdJAq9AHp2hHVLYfJ9MUSIokR8zU3oTvSMZvecQh3ndf7
         PwlxUwmlUVLsNDuFCTLNOcJWUl0aBjNBu+o5AgcS5W59ftDafLUkKZ4uL/sCPE1xPTpX
         h9nLYicy+6pEJwF2EVCmGLdPdf8QGxMoaXm76OJb6BlO0hz3H6nx4eV90V6tSxlxOgUG
         6Pk37JUQYR3rqaoFPP+BZqT4Lhj+PWG7LyGzHtUM6C8KJrbY3JVs0YRoFk2cGmktfUru
         lyIg==
X-Gm-Message-State: AOJu0Ywm8MQCqqqjLLbHaxvGAFdmoAivKeEOCreZr6lCnkCmP8zyOTJl
	3vy31cnCA4+N6RjWmfoUxMD46m6uDroMqIVBiILyrc2tMjYDL61Z1i+NKpcqeCsl7pMoMaQeHjm
	TqMbFD6owKljBwTCAe2giN230h+0NlBNCEoVZ
X-Gm-Gg: Acq92OHuhyWj9mustZJz07jQuVn9ue0T7lorx9GEChsZWADdGk0dfgc2OQnhpFPAB1X
	oy0iKBIGalzf7UUmIPi66u+nwOhZ5qbmr+gx07vi6v7ySjSiDo6JKKQJXZ3n6O+n++qnDYd4oIs
	I31Xyve1mNI+3Tx/uIedL6238EJAOd6U8alqmO1IxmKRByiVn2WjVAmepN/qroz3MTj10yKXe4p
	e6H04vSYrlcGbNE9zfOPEA957IngomOXMLKPx5UpzbQigpREY2nhkGj4jJ2Zn7zFPi2recj6wsm
	eq6sbA==
X-Received: by 2002:a17:907:971b:b0:bd8:6cda:50b8 with SMTP id
 a640c23a62f3a-bd86cda67a5mr597450766b.43.1779255952194; Tue, 19 May 2026
 22:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260520044046.7553-1-linux.amoon@gmail.com> <20260520045905.6ACBA1F000E9@smtp.kernel.org>
In-Reply-To: <20260520045905.6ACBA1F000E9@smtp.kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 20 May 2026 11:15:34 +0530
X-Gm-Features: AVHnY4LHH1gqrq6YciQlOU1NJ2KSNPs18Yau2V93ytKcb2CbD-Htq78PbA-CKBM
Message-ID: <CANAwSgScmdtObKtTr7A52y5rodPd6uCgVa1m5o+sD7omVDgKLw@mail.gmail.com>
Subject: Re: [PATCH v3] media: meson: vdec: Fix memory leak in error path of vdec_open
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Wed, 20 May 2026 at 10:29, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
Thanks for your review comments
>
> Pre-existing issues:
> - [Critical] The `sess->esparser_queue_work` work item is not canceled be=
fore freeing the session context, leading to a potential Use-After-Free vul=
nerability.
> - [High] The patch attempts to fix a memory leak reported by kmemleak, bu=
t misdiagnoses the root cause and leaves the primary memory leak (the V4L2 =
control handler) unresolved.
> - [High] The driver does not verify if `kthread_run()` returns an `ERR_PT=
R`, leading to a kernel panic when `kthread_stop()` is called.
> --
>
> commit acccc4fc02fe5e1be0c545d1722179667c078475
> Author: Anand Moon <linux.amoon@gmail.com>
>
> media: meson: vdec: Fix memory leak in error path of vdec_open
>
> This commit introduces a proper err_m2m_ctx_release label in the
> vdec_open function. It ensures v4l2_m2m_ctx_release is called when
> vdec_init_ctrls fails, preventing a memory leak of the m2m context.
>
> > diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/=
media/meson/vdec/vdec.c
> > index 4b77ec1af5a76..a039d925c0fe5 100644
> > --- a/drivers/staging/media/meson/vdec/vdec.c
> > +++ b/drivers/staging/media/meson/vdec/vdec.c
> > @@ -889,7 +889,7 @@ static int vdec_open(struct file *file)
> >
> >       ret =3D vdec_init_ctrls(sess);
> >       if (ret)
> > -             goto err_m2m_release;
> > +             goto err_m2m_ctx_release;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does vdec_close() properly
> free the v4l2 control handler memory allocated by vdec_init_ctrls() here?
>
> While this patch fixes the m2m context leak on the error path, if
> vdec_close() fails to call v4l2_ctrl_handler_free(&sess->ctrl_handler),
> could this control handler memory still leak on every successful open and
> close cycle?
>
> [Severity: Critical]
> This is a pre-existing issue, but is the sess->esparser_queue_work item
> canceled before freeing the session context?
>
> The work item is initialized in vdec_open():
>
> vdec_open() {
>     ...
>     INIT_WORK(&sess->esparser_queue_work, esparser_queue_all_src);
>     ...
> }
>
> If vdec_close() calls kfree(sess) without first stopping or synchronizing
> with this background work via cancel_work_sync(), could a concurrently
> running esparser_queue_all_src() dereference the freed sess structure and
> trigger a use-after-free?
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does the driver verify if
> kthread_run() returns an ERR_PTR when starting the recycle thread?
>
> If thread creation fails in vdec_start_streaming() and returns an ERR_PTR=
,
> could a later call to kthread_stop(sess->recycle_thread) in
> vdec_stop_streaming() attempt to dereference that ERR_PTR and cause a
> kernel panic?
>
I will try to address these issues in the next version.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520044046.75=
53-1-linux.amoon@gmail.com?part=3D1

Thanks
-Anand
