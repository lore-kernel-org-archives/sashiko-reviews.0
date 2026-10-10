Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9717839D6D6
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 05:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791608582; cv=none; b=M1ne0KCJluTj3/b0OOyENetMK3DodPwmQz71Akupm3VFqvp24DjwUrwmhZtSyf4VOHqNg2LigjkFnJ0ic3eDLOlcmsaT5t9GFZZAWM1WOiA2XOa3PYV8lxXuvJAe2pN+n2Y78hCIKtcNmm+uSI3oX6KbHnh77W573mZEahrk7lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791608582; c=relaxed/simple;
	bh=hIt0fix7U4Ug7V1Poe/TVuBEz3XvwXLxdfPz6owQiu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5AnTGEFBAiHR+w+tST4Pup6scB+mXV5aIRAeIWcSmzbN3tKFOlVlRDP72V+SLiwvY0bhdBNSjk+5NuVS6XI23Dt77CLDuglZaGNuBZ6Cq0Ysqdd1AmCBM0MfqqiFv6ScrY8WwH8BnFoS7Yrup8ykSY10qYWEK71LJBaijbHVqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4TZL+/x; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4TZL+/x"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35829219da8so276921eec.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 22:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791608576; x=1792213376; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DW/QQM+SN8lHBKI9RQtMNJfJ5uJuPnqwaUfrmF5FFDI=;
        b=B4TZL+/xumf010xcEJHsCcUVKNseDsJz0tu/JYg6OqNvIpZqEd9a03g4Q92p53y2jI
         R9UQWy9iTFHFSZ9ZKFFoceBXw9BfhGNsQV6B4o1OI+cvg1W3KgBz7NFZTp429YihswXk
         MmuUmj9vDvDmRtm5P8kecpdz1BAXMAeRU2lYbK+lCL3sX7ALgGX7/N+9T95kChnV2FSx
         EZzEBVX0Fqz+GjYcYMxqRTE084dg3xnVC8EZY7umMJJt9LlYLydJw9wV9HMwHBPvWzYY
         t09J7KQP4kmKGgdREAimE7r0S4KRQv/qgO7W5KLBZxL5B9hFUj3HK34ZhTlAFxDKCfYv
         ruXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791608576; x=1792213376;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DW/QQM+SN8lHBKI9RQtMNJfJ5uJuPnqwaUfrmF5FFDI=;
        b=qGXvAOtqlgfmaoKZU75MnAXQh2CwSL6UOEF+7hWg7YgqkZoy7XoMhigxAqmUvXxPw9
         HssApl+9ggLaV2H8c0WHPRMO9Pax68qndcHNyxVwYhkq0keVd9xS5vJZrp7J8BsKJAL/
         tE9WRz54zxU9hD/+So609QeZ8zBu9pvFvdyelhPsmBHm4f6sum352moZ37bAZbF0Nh9V
         f9XENK3agNWI6NJYAE9gYbmiz+CgoNNOiuvfTC18S//k3dBirISfhxwGGzVDc4aI7Ul8
         nytswSvO8+T/iDrayxHm1iAjdOF9GvolLi3h6eT+MelxdWDYp50joj1O10h354SQ9OtQ
         nStQ==
X-Gm-Message-State: AFq9FYLi52M2SVO2c2uxVhGMl7PoQKCd39CGInAWNJ2r1QMWpGG3deEz
	kIgTAArZ3AEqquP7hEzdtjLBEghGUMq9VrvKY7i/5YR5+jB08p5maFjohQXwoKph
X-Gm-Gg: AYBFou0cLkXqXHAFC8CY/UMdEWghU29qzOOZX3GYg8bIBDKzlPYv5cJ0zGtz0WIq+gR
	4m/8NAF3RYe4dByU4D8SDcUxPAla/3mMHHkyCOCZnoxJBTHJBeLjevLygX3B93bYXHwNxXrJTVD
	RY5ptrjm6JHlomRTOH56XMeRyreWoA/f4kOcDVdMOb1bcAc55lbtKoHMloHcldSvhSwpNOjC9ot
	e7o4xN415RUxs150bYyXOkpYz5Y5Si6IYvZncbdzSABte4ZDnIkqEcMaYokN1dgto+VlAjWnrgw
	tJt34vUNW1T01MvLjG8+Y2gfmTVehUu/12ugb5pybWkrD5aO7OlsxaiZDeTvCkka8QbMlheyRFX
	s2GqPCPAD3c4l5YjrhJcjtJAWvqIcCx0eoM6t8HRMwQg7+Lz/K0xw2GNvbAX+xvCFUTUbmyNjti
	fFeWWlo1AmoMjTdeIZykTrqZ/vU4SjDrlQ2/rSC9aWneGV7TwwM3TACiwNPM9qy4vlUNXBGxeaN
	+lOr0glLiufauj3Sq02CS5cc3BZSFE9t4b6qdcV
X-Received: by 2002:a05:7300:aeaf:b0:341:c383:9afb with SMTP id 5a478bee46e88-3536c59ed2amr5265002eec.20.1791608575167;
        Fri, 09 Oct 2026 22:02:55 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b7ea:19aa:c6f7:8c02])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca67b21sm11045338eec.11.2026.10.09.22.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 22:02:54 -0700 (PDT)
Date: Fri, 9 Oct 2026 22:02:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: reject parent overrides on managed input devices
Message-ID: <asnFTCpEdMmOAK-L@google.com>
References: <asmCc1VxVPLIMgY6@google.com>
 <sashiko-outbox-166252@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-166252@kernel.org>

On Sat, Oct 10, 2026 at 04:04:42AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] input: newly added parent check breaks existing managed drivers
> - [High] input: NULL pointer dereference in input_free_device()
> --
> 
> commit 5c214b0cacbe95369ec05dede9ca4ab2c7e279f1
> Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Input: reject parent overrides on managed input devices
> 
> This commit adds a strict check to ensure that the parent of a managed
> input device is not overridden or cleared before registration. It returns
> -EINVAL if the parent does not match the original device that allocated
> the managed input device. KUnit tests are also added to verify this
> behavior.
> 
> > diff --git a/drivers/input/input.c b/drivers/input/input.c
> > index 78c10eea7328d..1cca6d48f5977 100644
> > --- a/drivers/input/input.c
> > +++ b/drivers/input/input.c
> > @@ -2396,6 +2396,14 @@ int input_register_device(struct input_dev *dev)
> >  	}
> >  
> >  	if (dev->devres_managed) {
> > +		if (!dev->dev.parent ||
> > +		    !devres_find(dev->dev.parent, devm_input_device_release,
> > +				 devm_input_device_match, dev)) {
> > +			dev_err(&dev->dev,
> > +				"Parent of managed input device was overridden, refusing to register\n");
> > +			return -EINVAL;
> 
> [Severity: High]
> Does this new strict check break existing in-tree drivers that legitimately
> reparent the input device during probe?
> 
> For example, looking at da7280_probe() in drivers/input/misc/da7280.c:
> 
> da7280_probe() {
>     input_dev = devm_input_allocate_device(dev);
>     ...
>     input_dev->dev.parent = client->dev.parent;
>     ...
>     error = input_register_device(input_dev);
> }
> 
> Another example is tps6507x_ts_probe() in drivers/input/touchscreen/tps6507x-ts.c:
> 
> tps6507x_ts_probe() {
>     poll_dev = devm_input_allocate_device(&i2c->dev);
>     ...
>     poll_dev->dev.parent = tsc->dev;
>     ...
>     error = input_register_device(poll_dev);
> }
> 
> Because these drivers explicitly override dev.parent before registration,
> wouldn't this new check unconditionally fail with -EINVAL and break their
> initialization sequence?

No drivers should be doing such overrides. I already posted patches
fixing it up.

> 
> [Severity: High]
> If this error path is triggered, can it lead to a NULL pointer dereference
> or double-free when the driver cleans up?
> 
> When a managed driver's probe fails here, it will typically call
> input_free_device() in its error path.  However, input_free_device() trusts
> dev->dev.parent unconditionally:
> 
> drivers/input/input.c:input_free_device() {
>     ...
>     if (dev->devres_managed)
>         WARN_ON(devres_destroy(dev->dev.parent,
>                                devm_input_device_release,
>                                devm_input_device_match,
>                                dev));
>     ...
> }
> 
> If dev.parent was cleared to NULL before input_register_device() was called,
> wouldn't passing NULL to devres_destroy() cause a crash when it tries to
> lock the devres list?
> 
> Alternatively, if the device was reparented to a different device,
> devres_destroy() would fail to find the devres on the new parent.  Wouldn't
> this fail to untrack the devres, leading to a double-free later when the
> original devm owner is unbound?

Given that drivers should not be doing it I am not worries about this
case. They'll get an error message first.

Thanks.

-- 
Dmitry
