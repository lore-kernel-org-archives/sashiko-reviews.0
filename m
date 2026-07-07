Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2AD390608
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 09:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415182; cv=none; b=moVhHQUhkndDL/a0LCg+xVd6LhB4zX9YTCTwmOfQezFjCiaK8Whbj1hp53iDN5UyPVnvKyKV2ciIeFyNyyoN72slpkRWs2bXzJSHzDi47kx+jyGEMCO9k2VbeQxIbNd48oQN3icA66i1hSvJErM/h5flGnnQc8Mz+U1oNlELNhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415182; c=relaxed/simple;
	bh=68KtwaVgG7YT5uaY6FkpMTgksL0UJpvFapAzT8vuUYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jC2Umc1E8jgrWb5WIPJ5PFgJhZKpIKWi/6FrUEogDML4R3uxN5GwyX3qrh2VxhxOBYYX+HOqfYt8VaSDaDZEirdESItW1L3ADfNXd364BcJwLlNB0lAUkJ8dkpL180sBaJfikOk7h2+MzOM0zP8fnnr/heoKWR6d7TWkOHPdZLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FC5pWLQ5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FC5pWLQ5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so21421075e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 02:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783415179; x=1784019979; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5SemckqR+RbELmdvJiNqgdbo6JbgxB0VBziPWlK0PM=;
        b=FC5pWLQ5s9oUOsQqI+pi92qzeb1VYUq5u/GpSKGE/r2MNTBIrguUeV1gaoMJBYr2cC
         s2oIwlihBoGZq8fbuH4Q3rJMWqdzL0Rs+ZoINygEjdUpjZZKYdIGXJtoGmyVmCwZs0AF
         NIiZeL7drizmHHgqw6mCnfcANU2VzGP/58i8nIvDyKsvNOIf4/deVXNsBwOPlPK0L9fT
         DfJ2z7m+Ud6ktyLlRc49LEY391/kUYcyg5PjAkxUdyZyJrhNi1tY/QGwvLvKkdU+AAXd
         bHrRWtqqPpmWHbE1BGSYR4FgXw6LrwvtujIAQo2U1+4o4Dg0nNIxY9KCFSOGl/OH4aNI
         +uuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415179; x=1784019979;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5SemckqR+RbELmdvJiNqgdbo6JbgxB0VBziPWlK0PM=;
        b=rGQigOIWYENfXY8UQph8a9xkAMyXF+uSHMPfAtd3o/LKuIcQOpjDfWfNntfyRLDXbs
         uz/c5mXWbd6srCr7lvMeZN2CDR/FWtYKKn0IQhwC6XrykC2OCjp/yxFBFhiJX2EvjLdO
         cSTyVDZD1Nb6AVl/4nXW7eAV/pU/h3af6A7pOdOneXa65cJicPVRALr7CeI0iWrFiW4t
         bs5bedKK8CPYx0vc7fIkXSikAelNCdZJVuLqTyjPdcgZEl1lQ6MoD4EIYcso++wTmrT/
         sY5mA4fDHu4ycm722KpntVfn475JkHWh+NwUgCmmItpwQl0fvnUg93MduJu45aQU6d4F
         KF+w==
X-Forwarded-Encrypted: i=1; AHgh+RoAbpqYGk5tp/pwVZ2pg6/5WOBwW1hYN7NVmrS/BQ9w+xAezePJosCGMOUdWCZMYTyMA9TTP8gMpNhmjlfF+3o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxzy/c0LfKcYigIqp3iBQWEs1cfo1G0vohLxGk4TR2bqrQ3EQBV
	p3kdXUN0GQpv98gDkVeYD77s2ZOaSVYONSPedH3wJWZIi1Nx+/ltek/bJ0UhmrJ2vA==
X-Gm-Gg: AfdE7cnTvQ47lc9vGMHsyBvBgOtJFXp5O7OFt7c67JFzyor86z+RbqDyjd2fqzEeBBf
	bfCitMwCUMaHyhvsz8+/r5CAMzul3Qk5aJOs7Ds0x8TUQu1TU1U31eZvFmorXKVLh0hh+OkCBqP
	Ygf1xgh/VoaqMEyPp2CgrzULus6AHgLuKYgnlfDvkVnCLr0+CQohWC5gh5rE8ltWZ8lKNjqp4FN
	qsD9tdiao1RwHJM+IhxogJnGAQ5hrU9y5iTnskw97gKSzLT2eQbb0bGMN4R44U3ZQnZZZiN67v3
	6BerMFC/m9+qoB6dFpFomBXmfIFpScOf3Idkyuky4qvjgGHyefIJm+wYdvhKh48cqmk+jmNuqvF
	E5cmnQLckUUt3+8HniN2aCJDYRn/DgbrwDep6N3KEn8pjieZHtbULN3Y5yXdzCAeNt6S+WJp3m4
	LbmxOQYGy3Zehipi6RruPs7+vEnkPdL+lkNqJ0hHF17Xd1RMpM8kh48Q==
X-Received: by 2002:a05:600c:5611:b0:493:de89:61b with SMTP id 5b1f17b1804b1-493df077f31mr35685135e9.26.1783415178361;
        Tue, 07 Jul 2026 02:06:18 -0700 (PDT)
Received: from google.com ([2a00:79e0:288a:8:c86d:9b87:b8af:84e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5b811sm62148475e9.13.2026.07.07.02.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:06:17 -0700 (PDT)
Date: Tue, 7 Jul 2026 11:06:12 +0200
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Manish Khadka <maskmemanish@gmail.com>, dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org, sashiko-reviews@lists.linux.dev,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Lee Jones <joneslee@google.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v2] HID: hid-lenovo-go: cancel cfg_setup work in
 hid_go_cfg_remove()
Message-ID: <akzBhKTOVpaTb4nT@google.com>
References: <20260515174511.78486-1-maskmemanish@gmail.com>
 <20260515182347.6C82FC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260515182347.6C82FC2BCB0@smtp.kernel.org>

Hello Derek and Mark!

May I please draw your attention to this issue in the hid-lenovo drivers,
which was pointed out by Sashiko:


On Fri, May 15, 2026 at 06:23:46PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
> - [Critical] Hardware state corruption and crashes due to use of a static global struct for device data.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


> > diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
> > index d4d26c7833563..b9d8cde531365 100644
> > --- a/drivers/hid/hid-lenovo-go.c
> > +++ b/drivers/hid/hid-lenovo-go.c
> > @@ -2408,6 +2408,15 @@ static int hid_go_cfg_probe(struct hid_device *hdev,
> >  
> >  static void hid_go_cfg_remove(struct hid_device *hdev)
> >  {
> > +	/*
> > +	 * cfg_setup is scheduled from hid_go_cfg_probe() with a 2 ms delay
> > +	 * and dereferences drvdata.hdev.  Drain it here before tearing
> > +	 * down so the workqueue cannot run after hid_destroy_device()'s
> > +	 * put_device() has released the underlying hdev and dereference
> > +	 * a stale drvdata.hdev pointer.
> > +	 */
> > +	cancel_delayed_work_sync(&drvdata.go_cfg_setup);
> 
> This isn't a bug introduced by this patch, but does the driver use a global
> static variable (static struct hid_go_cfg drvdata) to store device state?
> 
> A second device probe would unconditionally overwrite drvdata.hdev and
> re-initialize both drvdata.cfg_mutex and drvdata.go_cfg_setup.
> 
> Re-initializing an active mutex destroys its wait lists, and re-initializing
> an active delayed work overwrites its linked list pointers, leading to
> immediate memory corruption and kernel panics.
> 
> Should the device state be dynamically allocated per-instance instead?


This is the same issue which was also introduced in hid-oxp, which I
pointed out in [1].  As the review-bot points out above, while the data in
your static drvdata variable is maybe only necessary once (but that
also seems questionable?), I think the mutex and workqueue shouldn't
just get re-initialized in the middle of being used, when a second device is
plugged in and the probe() hook runs again.

This pattern is used in both the drivers hid-lenovo-go.c, hid-lenovo-go-s.c,
as well as in the newer hid-oxp discussed in [1].

Shouldn't the drvdata just be allocated with one of the devm_*alloc() variants
as in the other drivers?

—Günther


[1] https://lore.kernel.org/all/akfGTjId84EjV141@google.com/
