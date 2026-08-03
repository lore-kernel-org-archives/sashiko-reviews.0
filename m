Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6772882DE
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 02:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785722922; cv=none; b=H4HAAIJFUA/K+E+7RsZAb86jWUs4rdDprfgDN7IixI8KvLhc0l57fO5Qmx1VYJo7cb2QMIsYQlYuBqgJAaOSzAWIieJBkEhpxrbLrafglhwggFqhsr/2oYzIdUvZDfe190fIFESW5ulX5zYuFjLRJryHjEDl3B5ug4Fz9SzcbkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785722922; c=relaxed/simple;
	bh=AHJ3l8cp9/rS1XJ+TanSKKPtiX17734f95CEuX4Cmeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDaMncbGxX7LiLkuSyTqTPKqsWqu9xV8jJF91x1UFAypp70q7skzEfgL+WQO2BMLZBAL+gdoKbFZWGMYHUbqMW2Tq+4IuSn+ak6Ist5QbKyjLBIWfbi7CssCKIM+RkLHMn2wRESR+eAYGu8ftCBGaJCRsa5/Fm8hLd+X3LYq2bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNEB4asD; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNEB4asD"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso1811445a12.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 19:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785722921; x=1786327721; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N4/bOpqWkvxOz9b8PfEg+piIEtGDMNuYW9DL+iKLTwE=;
        b=lNEB4asDmOBZ8HXQlidiXp+yi/W+Cz7j4LFf3i2cCKBsMnV7ffiIBDWuVLG/BaGL6b
         NfMZ5Fp0PVDptVMw7ViSCUyIHAmpcUmgK5PfOJbQeb6X2W14Wrk2N7XH78i8PHzTzu6s
         i74lNkYuV+CI9vMU+/YTrLCEdUNebEWhvpZXFhg903mpNFKPZi6ojY1n251+KueepLRj
         Bq4ODErseHVmZgRrlrc54j9txEq+zHmJ5pV7g1veGeJE+3pZvN6EQil08SdxvMpxuxAZ
         IVLj4tDndvXyE2sVJPh+AsgDfrJvdWj6JsoakRdPF1q8d9FnGu6r4xsrvUV8k+2qURj7
         B9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785722921; x=1786327721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4/bOpqWkvxOz9b8PfEg+piIEtGDMNuYW9DL+iKLTwE=;
        b=I8k3XiUqpxhIWEdeReHsS+a80UltDa7IriOCGW+0y5QZgJA8AfRAQ3qq+ufVNjeDPO
         8GYdGpcTJvYgVOZzKnrdgbJcfk0m6KkVgy6flmjmjZG7qT4wo6PyfKo0rURuCMaPE5tB
         MWD2EDhqXjmuVm241UVDOCEQMGjodcnnuTwSyU13U9ENmvX6odM0sTSq6uUnLbd2gil3
         NMDuL/WXmSLCHbZDHQDgFvS4G8jLQjl/adhBYd51UZYWJ+Y6hO6RZFvWd0o+B8NOYM7c
         0GyxsuyRTAgn2F4F+RqmFeyUIau70iUaE6KQQiX/AMvvSKq2u1DJFjo7EFOOnItIG8NS
         d6RA==
X-Gm-Message-State: AOJu0YwJaChQefV1zE/FFfamZnDbRGIFt934kRotu0g88ygoB7l+CAuu
	OdElqWGk15JPZG22b+I9QAcXKLz08Zvue+naAWhwIjYO/KFeaNzyKi5h759b3w==
X-Gm-Gg: AR+sD11BztjCmLuPg0mGCyDsJ5bEd/+mAgKKu/Q8O2HeJ6ndtcX5YYZO/3TysVKiELl
	ciBUW/dNFw2XR689rCQoh2XznL5mHL1eESTxpxacwYJnx5NqVH9nZXDr12Ln9PWNRSITC+GLF5n
	F8ErQsv/gXpOBJmLaKRhoxUeyaKlsMAqRBcaTqurB27rlNqQBrjJBC4vkl7XWwPwVsUmjuuYYe8
	xNCe8I4+feYO7qad4yvYCISF6swO5QRjgtXDeRuiZydTJ4ZXP2ha+xCZ15R9BglWOyVqbUsFgBi
	wU4t86bI5LJvYMp9CErtEdcH9NQW9o4YXV4TsiIjT//j+LHshgDDRUyO5fC34KCqwzsdlVnJX6T
	wVxQSKh49cL+uguI8uZQszhW681gGPbVCn06n8sgLTj2sZ5b4NFHmAtGgzSJ8W1DaiYgYP8FVRY
	xCLAi8cPnFkVP5Q4Etjb8t3mv++rGih3s3V7XSMHxCJRf7JCdVlNJ9gaFhKMHosjhPZ7feEBD72
	LMNrcR6mVj4SXAuXtXz6KjMlA5gVw==
X-Received: by 2002:a05:6a21:4ed1:20b0:3c9:346f:c1fc with SMTP id adf61e73a8af0-3c9346fc2e6mr4947969637.61.1785722920771;
        Sun, 02 Aug 2026 19:08:40 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:4fff:876c:cdae:e53c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab14475asm24976908c88.5.2026.08.02.19.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 19:08:40 -0700 (PDT)
Date: Sun, 2 Aug 2026 19:08:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH v2 2/4] Input: clear inhibited flag before re-opening
 device on uninhibit
Message-ID: <am_38bVYs932qXlh@google.com>
References: <20260803005210.1251102-1-dmitry.torokhov@gmail.com>
 <20260803005210.1251102-2-dmitry.torokhov@gmail.com>
 <20260803011832.A000D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803011832.A000D1F000E9@smtp.kernel.org>

On Mon, Aug 03, 2026 at 01:18:32AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] When `dev->open()` fails during uninhibiting, restoring `dev->inhibited = true` without holding `dev->event_lock` and without releasing active keys leaves events permanently stuck in userspace.
> --
> 
> --- Patch [2]: [PATCH v2 2/4] Input: clear inhibited flag before re-opening device on uninhibit ---
> commit f055731a6a02bc8698a040a5af7e51e9039340a7
> Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Input: clear inhibited flag before re-opening device on uninhibit
> 
> This patch clears dev->inhibited before calling dev->open() when
> uninhibiting a device. It ensures initial events are delivered to handlers,
> and restores dev->inhibited if dev->open() fails.
> 
> > diff --git a/drivers/input/input.c b/drivers/input/input.c
> > --- a/drivers/input/input.c
> > +++ b/drivers/input/input.c
> > @@ -1813,24 +1813,26 @@ static int input_uninhibit_device(struct input_dev *dev)
> >  	if (!dev->inhibited)
> >  		return 0;
> >  
> > +	dev->inhibited = false;
> > +
> >  	if (dev->users) {
> >  		if (dev->open) {
> >  			error = dev->open(dev);
> > -			if (error)
> > +			if (error) {
> > +				dev->inhibited = true;
> 
> [Severity: Medium]
> When dev->open() fails and dev->inhibited is restored to true, is there a
> potential data race with concurrent input_handle_event() readers?
> 
> Since dev->inhibited was set to false earlier, the driver's open() method or
> interrupts could have emitted events before the failure. Does restoring
> dev->inhibited here without holding dev->event_lock and without synthesizing
> key releases via input_dev_release_keys() risk leaving events permanently
> stuck in userspace?

Userspace has to clean up its own state after a device disappears.

Thanks.

-- 
Dmitry
