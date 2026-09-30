Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEBE368D71
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 05:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790745290; cv=none; b=A/aGMOEdQfba5G8QJHthNFTL0IsS5vWmySYfPCIq0hfW4Kt1gL6FxELo6cDtUlpQiRHS/a/BjM7XeQezP6WmWKYXZdWMjeLXCeKd9/S/HP3yRbxpGpq21dTFVSkK08l8OFxHYahrt4oEFMnLSdz67MWElhkHv+BuQhUxEfQbjIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790745290; c=relaxed/simple;
	bh=0DwyDbiXHFs6nzuVuyMWZLug6XA5RmgSBkppMkUsuCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUn1yqB8fg1sVSKQO763MwBW4gUDg355HoIKKdViaothHC4piIlnEeXUZjSEaY1hg+GLI0tjr0f6MAh3dlz91svMT7eb9XoSaaI8xITcCF1sNe9+KBlt25jarekeyZ9WjUMF+aIp0x/zqIEL8OXEZvvXEWHttE3TnLOEvmSef5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABq3wUem; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABq3wUem"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04be84so5961611c88.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 22:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790745288; x=1791350088; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9KLD/n4FOKEHxzSj3ZLLw0Kd4SGiqNFcDpZxx8Aapk=;
        b=ABq3wUemwd2wDatYztOEycE+jvRC6gGyZNR5WjfZFGsWsTNlsi+7w4AvZcFMrMANG6
         Nn8GMfzkrkmqVBUl5jcYIwEIAtybE5vF0FG7vefii7BiSD3aSq6+xfvrmlirSM0RIkTA
         fRnV9D671R8+g/voFTWLt6zfhtzh8zbEB6Go5dshyqhEiRqzNzUHeUIA++IpJCqp97/N
         45gcsXFPK4YN73Tf7krPMk2MilMvcZWXTsmrS320igU2m9Ew17K2tRee9nX2y4lkC2WQ
         vlyxAneUm4fVeGmN1GFgqX3LvhAYDQ+XdlZPM3eVAN/D9pdVQEj0f7BT0FEmYEiFDVWn
         0Mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790745288; x=1791350088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9KLD/n4FOKEHxzSj3ZLLw0Kd4SGiqNFcDpZxx8Aapk=;
        b=iuvjhOC7XcZO2TZSIqOw9FqICGT9Zt/CD4/xBTy5tjE2OL24kXhZUV5TKICjR8NNVh
         kO8KiDcyCEn/Q6icKWfS8EKoSEfwHOvTwNsg39rE14B1umAqtwOM+h0ffiyw7+yeqkVe
         AkfXtVe+uKAIYcDS9LSQ6XunQq0hID/DAnABDITfson0fhrKjf6D8HCxBSlu/7lqa/+p
         cmhO87zA5mA94y/T3XiS9tEgjppbbDgkvefHd2lxP6YER1UFmlvN1f62NnJLHW+EPJJa
         Ylmdp627KtAEBK8QozlHCA10Vy4E2umXFBuS2wqYO8JbNYkEZbBd1Pep6ByXZbs16nSE
         50iQ==
X-Gm-Message-State: AFuF++kKHsSJorHY7rL13L2nI19QwuGH6FgyO63vPIXZstP5hyHcfdhy
	PQhOeRmDWeO0OIZiRbW6PC/WjqU8zbwLNYd89102/7rTOQWzheq1vE+Rwijzy97P
X-Gm-Gg: AYBFou2B9pTQcyczYvAZx89ijxa9CNiBF8cF2XrafO24yuFWeJa3zHnUWsZg/+os3Mt
	+JZKhWHtyqq3sVX85pL1/mQgbRVSkcdtbJUNlpY7HoXdPeHA7FEBdNCgxyYtrT0oQWbwQTw/yBs
	+mPU7/8dfeOQFabcB81NtXdZfwIgrbdhes7lOfHWVFbchYVgPAeWVTrcBv3oJJEQJmqLM1gL/1t
	vqJkYfYljxagq0FhzazVFi/+MJpdCM+9XMQPG9eF5PP3+GamLo3yavLI5oc8XziBh9lzuUigdI4
	bP7shrDaeyj8lFOfAeQTurY0zYpFwprMsPYE+Xa5pScWGRQXRLbUzGUR6E7U5VNEfQFWFP4F7aN
	H1eyTATnjLu4sfWtRiSqyrkTb/kw09gYQYACWRI+KQP+S+dCrGr0obmDeMAT1I/alUeHZzYL2mI
	SJk1huCC5rQwIxtWAZO+0OY9xnCpzrjOjYXqxoDlYzRL+42kssbExLxuWoKxTUgSYAsYDIJ0Z+R
	C6d9wl13yVOk1nIk1C7pBXCk92CD24XilsZ3a3N
X-Received: by 2002:a05:7023:a4b:20b0:143:342a:3d3d with SMTP id a92af1059eb24-14d2d8b8ac8mr124363c88.0.1790745288339;
        Tue, 29 Sep 2026 22:14:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:101a:5ce6:a15e:d8ca])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d089da7e0sm1218538c88.10.2026.09.29.22.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:14:47 -0700 (PDT)
Date: Tue, 29 Sep 2026 22:14:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: David Heidelberg <david@ixit.cz>, linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: s6sy761 - fix resume ordering and restore
 sensing
Message-ID: <aryaRAaXNJTv0yUG@google.com>
References: <20260926-s6sy761-suspend-v2-1-8f00a96ee6e8@ixit.cz>
 <20260926203744.82FAA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926203744.82FAA1F000FF@smtp.kernel.org>

On Sat, Sep 26, 2026 at 08:37:44PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] input: permanent IRQ disable on s6sy761_power_on() failure
> --
> 
> commit e5e3e44a0960351c54b4dc02894567b7b504952c
> Author: David Heidelberg <david@ixit.cz>
> 
> Input: s6sy761 - fix resume ordering and restore sensing
> 
> This commit alters the resume ordering to power on the controller before
> unmasking the interrupt, addressing an issue where the boot-complete
> event was consumed prematurely. It also ensures SENSE_ON is re-sent upon
> resume if the input device is already open.
> 
> > diff --git a/drivers/input/touchscreen/s6sy761.c b/drivers/input/touchscreen/s6sy761.c
> > index 0f24a9b730635..899c179fb2d31 100644
> > --- a/drivers/input/touchscreen/s6sy761.c
> > +++ b/drivers/input/touchscreen/s6sy761.c
> > @@ -500,10 +500,22 @@ static int s6sy761_suspend(struct device *dev)
> >  static int s6sy761_resume(struct device *dev)
> >  {
> >  	struct s6sy761_data *sdata = dev_get_drvdata(dev);
> > +	int err;
> > +
> > +	err = s6sy761_power_on(sdata);
> > +	if (err)
> > +		return err;
> 
> [Severity: Medium]
> Will this early return permanently disable the interrupt if power on fails?
> 
> If s6sy761_power_on() fails (for example, due to a transient I2C error
> during resume), this early return skips enable_irq(). However, the PM core
> will still clear the suspended state despite the error.

It looks like the PM core never implemented properly trackign device
state and not calling suspend on devices that has not resumed. That
means that we need to do it ourselves. We definitely do not want to keep
interrupts enabled if powering up the device failed.

I'll send out a patch fixing this.

Thanks.

-- 
Dmitry
