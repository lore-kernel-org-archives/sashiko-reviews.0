Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02879373BE6
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 15:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783437543; cv=none; b=lDSX6yTCNI3JPLI0ySILIRTf9W9FTSuUWQ/lrqfn/14eXOGCz5WXPsEjWIrRqd+vgXPYMfS2B6s2i9Q22YlUjmvyLAAWjw0q6cSIOJLyt4DTp3wnCconWMMGq0wjI3zVW028/Vhrskuk68X0ilGtnnLybzl6r5anrWeATSPQbtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783437543; c=relaxed/simple;
	bh=Tc/+NV/kn0eF0AEdWjxoP08LXHr862Uz8Cwk2GvLYHU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Wa86ghAORYcfitN0q/f8UR8fBzcvAk0ay1kZHDibDhzg0xJYmaZt629fmF3fN1JXUNSca+qadQECEjleQA+1MhuzwTF+fabCDvHiVTOGntPUiMucTQI7qdAf+lsjzrFmInVSvIMBRxmP/aZeROSAAywhFNvwm1f9XlFVos8APz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXHXqAW+; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXHXqAW+"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84832ec2615so849725b3a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 08:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783437541; x=1784042341; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QXR4bewYefu3+kO4hCMBqgEy8jEESEUp6CSGCcVG80c=;
        b=JXHXqAW+4q9h4aqXvmo3yda5hC4MYFEF0QcVxYWXM4g80skaFxjQGoJgtqopR0CsIX
         qtg0jvvA+sg/dqRTMrJDGGmFLsTyRbnmUyLhCaS9BBek+SkGVPnA99/mxQ1v+uJRv4xf
         Yk7ZO+zhYFeJrk7F1YCDlVQ3/qwcAwh8D/4dGLdrdoQZAJ/SfXI53RC3IYN1mvOIN6D2
         17RCsb9AAodrVKivbfOcHXBTrsYmeqqfK7eMZ2RNTZuyTt/gY4MKyPJ/JbYp4EataQBv
         fjFc7KL3vxtyASuDsO35bRSiyA0vpUN8HF8DSweFuUUxZyQEEiQVTUZdHuileQjGtfgH
         w/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783437541; x=1784042341;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXR4bewYefu3+kO4hCMBqgEy8jEESEUp6CSGCcVG80c=;
        b=bckReAfz1bUu3uLVJfquTZhFj5j8ojTm5H0qUYbsoIVK1Oy+6ik0rmxjgeBpAtlCUI
         Ji96NNGGg+7Fm9tqvgxtcWm5bg8Jol5PSa60KTIR/zF90rj++XJqZ62FwYUZ6JpcVF2s
         knJaAqgIHuuUeE+FqF+t+eMJ0nUJKZl/2cm2cEvcspLaknBjXEgjy8OhZJ7KdEQ3j4nw
         VF/JBFF0VzW+TOnLgQPsD5A6KgvjSHipGRCa42MSWjgHQ4Ae4qkPNbMUMMCaYf7/8lLP
         jnOmRJ0fv5/DJTOXE/Y1yCFiv7twg/OfPClVenpEHLgTKeH+zJfeWm7NsjvxQE3Juw0t
         2nYg==
X-Forwarded-Encrypted: i=1; AHgh+Rpp/G8WhwU+sx/SY750Al30qkCXY4SDa4DrYubCCuZaKdpZmLQNpuknzg6WFJn0/tjiRtF/o0c8bWn4GCbsWXg=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywtj+mnF8aJBZvIkjfYRjbfbNFK9bEVX6SWsoM/P8YOvjdc67Bt
	x1fblBCGQSNxhW78w1kcwzKPcaVeTF1IfAVM1Of/OnS/eQGHZDX+xcsOiAa9QA==
X-Gm-Gg: AfdE7ckAIvxTVr8zdLSJM1jN4emPRaSs2lVS9zJtLKXXnRS7s8jBNEFtdZXl44J7sGs
	Cd+yiXYzyR/qg5ON7eMBfA0TyIIEHtNMG/umWcyJDiRSp84LHFC8R5o1ws0plNN5YaDMnmSbMtt
	0DICeRHd2CQm/n4wP4M6UvOTzyWuYQ2/N34vzDBXCkQnIx5zkv45bvcQGrF5Ri80MeZggLcHl8i
	S04W4mW+rjba/5zsUR8+dgX/T57JWqBdQbpAcypg4Nv/9Vfoh32SaDQvck3uFmC6zzkF4c5as+Z
	ljcrQiyNOZJ3m5OOAZHzP3reBHtzub0z4g72CFB+3UB1FG020T5/Ybn8eh0ytWdP5MeKvEnWPsc
	Jx8IAPtgkpscUWYKPOqvLB5COM9SOH87iC8/5X5qQCQyY6vAh40rljGvS2ESJ0QioDueoX1W+oG
	WsqbsdGwgXdSqjSeRjDTbZ/0kQ/H71Of+XpM8QGPealsTmKkXQlu+xfxxRvmF4YUd79Hk69DEjb
	niHbyCsbsE=
X-Received: by 2002:a05:6a00:4b0b:b0:848:2f84:735 with SMTP id d2e1a72fcca58-8482f841650mr3042962b3a.72.1783437541276;
        Tue, 07 Jul 2026 08:19:01 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afeb060bsm1188440a12.14.2026.07.07.08.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 08:19:00 -0700 (PDT)
Date: Tue, 07 Jul 2026 08:19:01 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?ISO-8859-1?Q?G=FCnther_Noack?= <gnoack@google.com>
CC: Manish Khadka <maskmemanish@gmail.com>, dmitry.torokhov@gmail.com,
 linux-input@vger.kernel.org, sashiko-reviews@lists.linux.dev,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Lee Jones <joneslee@google.com>, Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_HID=3A_hid-lenovo-go=3A_canc?=
 =?US-ASCII?Q?el_cfg=5Fsetup_work_in_hid=5Fgo=5Fcfg=5Fremove=28=29?=
User-Agent: Thunderbird for Android
In-Reply-To: <akzBhKTOVpaTb4nT@google.com>
References: <20260515174511.78486-1-maskmemanish@gmail.com> <20260515182347.6C82FC2BCB0@smtp.kernel.org> <akzBhKTOVpaTb4nT@google.com>
Message-ID: <11817F6E-710C-48EE-A48A-9D4F8476339F@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 7, 2026 2:06:12 AM PDT, "G=C3=BCnther Noack" <gnoack@google=2Ecom> =
wrote:
>Hello Derek and Mark!
>
>May I please draw your attention to this issue in the hid-lenovo drivers,
>which was pointed out by Sashiko:
>
>
>On Fri, May 15, 2026 at 06:23:46PM +0000, sashiko-bot@kernel=2Eorg wrote:
>> Thank you for your contribution! Sashiko AI review found 7 potential is=
sue(s) to consider:
>> - [Critical] Hardware state corruption and crashes due to use of a stat=
ic global struct for device data=2E
>^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>
>> > diff --git a/drivers/hid/hid-lenovo-go=2Ec b/drivers/hid/hid-lenovo-g=
o=2Ec
>> > index d4d26c7833563=2E=2Eb9d8cde531365 100644
>> > --- a/drivers/hid/hid-lenovo-go=2Ec
>> > +++ b/drivers/hid/hid-lenovo-go=2Ec
>> > @@ -2408,6 +2408,15 @@ static int hid_go_cfg_probe(struct hid_device =
*hdev,
>> > =20
>> >  static void hid_go_cfg_remove(struct hid_device *hdev)
>> >  {
>> > +	/*
>> > +	 * cfg_setup is scheduled from hid_go_cfg_probe() with a 2 ms delay
>> > +	 * and dereferences drvdata=2Ehdev=2E  Drain it here before tearing
>> > +	 * down so the workqueue cannot run after hid_destroy_device()'s
>> > +	 * put_device() has released the underlying hdev and dereference
>> > +	 * a stale drvdata=2Ehdev pointer=2E
>> > +	 */
>> > +	cancel_delayed_work_sync(&drvdata=2Ego_cfg_setup);
>>=20
>> This isn't a bug introduced by this patch, but does the driver use a gl=
obal
>> static variable (static struct hid_go_cfg drvdata) to store device stat=
e?
>>=20
>> A second device probe would unconditionally overwrite drvdata=2Ehdev an=
d
>> re-initialize both drvdata=2Ecfg_mutex and drvdata=2Ego_cfg_setup=2E
>>=20
>> Re-initializing an active mutex destroys its wait lists, and re-initial=
izing
>> an active delayed work overwrites its linked list pointers, leading to
>> immediate memory corruption and kernel panics=2E
>>=20
>> Should the device state be dynamically allocated per-instance instead?
>
>
>This is the same issue which was also introduced in hid-oxp, which I
>pointed out in [1]=2E  As the review-bot points out above, while the data=
 in
>your static drvdata variable is maybe only necessary once (but that
>also seems questionable?), I think the mutex and workqueue shouldn't
>just get re-initialized in the middle of being used, when a second device=
 is
>plugged in and the probe() hook runs again=2E
>

Hi G=C3=BCnther,

While this is technically correct, the likelihood of this happening is rea=
listically zero=2E All of these drivers are used for handheld devices with =
built-in HID controllers=2E There is nothing to "plug-in" per say=2E

That being said, I do intend to return to these drivers and fix that issue=
=2E I was waiting to do that after the claw driver is merged as it is essen=
tially dealing with the same issues and that will provide a blueprint for a=
ll the needed changes in the others=2E=20

Thanks,
Derek

>This pattern is used in both the drivers hid-lenovo-go=2Ec, hid-lenovo-go=
-s=2Ec,
>as well as in the newer hid-oxp discussed in [1]=2E
>
>Shouldn't the drvdata just be allocated with one of the devm_*alloc() var=
iants
>as in the other drivers?
>
>=E2=80=94G=C3=BCnther
>
>
>[1] https://lore=2Ekernel=2Eorg/all/akfGTjId84EjV141@google=2Ecom/

