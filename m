Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0212DF12F
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 20:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787172179; cv=none; b=o+33h0BkuwYUo+U4nV7WWfbJMn3zYfS/TFYmNtsZGd1fq9qfbLMjZ19JqF+g+BOX+Ds7YG4YdwRAv0DJyDRpHiAj0/LTS55mX8KkugB07dbuha1fJP/QjDrywd2JsIlepMrBFduGAC2B7HZldpFar5oydkEYMw//u2tz9dUXUJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787172179; c=relaxed/simple;
	bh=lsmXjePorRAzUjJL6ORGR+bUFBHa1eeaFQXiJVML7fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=EinJ/YzQ0zJ8i3bnypT8qJnqn5bO2OlfOng3UCTpH+IT3+L+umtF5IJiN8AI6J0QuwxwBpwrZNTxKHqmjQnX6laC9gc+2PDmL1rY3ZrwcNd7y0bM2KXbZH2rU9lJsa2wsmuZrZPxoFY+JHEEnMzaXuLU28T1Dpb6YkhcqSGLPWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DAG/qhBA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DAG/qhBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787172177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HhcnPKvnBcdmIG5Q5TzyCZUomoVpouA/md8ztmVdXeM=;
	b=DAG/qhBA9/aLutGHDUVhh09t5BtpxyaqdpswwBABqd8iZN/TP4f5jKdTsUlSSHcID/W3UO
	ITifNX5C0rk1i+DX+t7b3Zx3PeKYLPeeqHqUHlHTpURDU4bC+8s/F/1LO2Gcma2UIfJT3p
	9d3r7PpPfI4TSsgG+Az6qFRk47gjWcw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-E6y_yH9SPZ-50ToxLhpBGA-1; Wed, 19 Aug 2026 16:42:55 -0400
X-MC-Unique: E6y_yH9SPZ-50ToxLhpBGA-1
X-Mimecast-MFC-AGG-ID: E6y_yH9SPZ-50ToxLhpBGA_1787172175
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-904ee4473a8so15432976d6.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 13:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787172175; x=1787776975;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HhcnPKvnBcdmIG5Q5TzyCZUomoVpouA/md8ztmVdXeM=;
        b=Y51T54dC3pD2hdw02P0PqCvG0rabXpgtZK23FTMqWTHwNzG1RfN9KxMSBLe9yUHLHZ
         ani55+Z0hqnJPIvXWttZalc++uoUH6OWll2C16M1kMdliORD6+ehQ5eDAUHg4RB3zU28
         SIH/EUaSVwEKIREUze/Es3ZfRCu90E0von68MDv2ajNVAhinzV6sfJRLsOjGMnAf4GgU
         ZKVFKq6nUMELJ56IQPaTiNONjQNbeAEGdnLRnXBLNc/WEjuZqsP6C62pziOBCFN6BwQ/
         OlXrh2TAtK9KGi8ffrq79k5UtVD318D6Ik56ozDqOvW9U49cpX4m/jTS1lfG+9kkderN
         6JjQ==
X-Gm-Message-State: AFuF++k1QdA0jE1j8I6CFK8KcgFp/tcPBXDKOiYFC0TehXUk2JnJNkzy
	ycaDWMTJr7XkIc7eAL4M2fp0HlFxIt1D+mwFIkhLs47uhOys0UJIjE9WMdFgpyfH//NFEIzotli
	An6/WqbsKCq3hMgpjBzDuYEpSQTUNrzsfQJ6COn/zf+RLNWuVd8c2kELgewjUrpH7iw7cTKy8Ie
	pKi7IKh+k+pcIYwSCI1lJuzEIIt1eAqhTh1QOG400HBo1Cy6aJeN52
X-Gm-Gg: AR+sD1291/J2ay1ubxtvAhbI9fMor7XPd1ouhJ1MOD+WAQpADyj8ztRwVZ4vzYqQ1Zy
	3asGlXUVOhQ9zcsfaWI4FqMlwmUds/EizNh23JkiDndSvS/AlQOYxNXsuVHE0cPtemFiL7CNsZf
	X583AiQD1NaOtnbt4HbCuk+WTsJUEe6SkubUL/QKrJA97J6CSPbeb+eXVX4343jRrVDYMGfPhEL
	gOwPvcutZnXUp33I8MWp87M412+Pd7J1tdcoEGWzzF5lUkCkuuzyg3qTBxeX+Phq5wIUYksF/PW
	8QGurouwWu7ri2atOylfby4MD/wgRSg9vpE9nL7DKU57LylF9yqfUJUWjV3u7tIdE2o55+ganSE
	VmAPdOONF9A==
X-Received: by 2002:a05:6214:2122:b0:90a:807d:31bf with SMTP id 6a1803df08f44-90c5eab90ffmr71349386d6.24.1787172175362;
        Wed, 19 Aug 2026 13:42:55 -0700 (PDT)
X-Received: by 2002:a05:6214:2122:b0:90a:807d:31bf with SMTP id 6a1803df08f44-90c5eab90ffmr71348866d6.24.1787172174902;
        Wed, 19 Aug 2026 13:42:54 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5edb4fa2sm22921116d6.10.2026.08.19.13.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:42:54 -0700 (PDT)
Date: Wed, 19 Aug 2026 13:42:51 -0700
From: Jared Kangas <jkangas@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/4] hwmon: (ina2xx) Replace regmap in
 ina226_alert_read() with ina2xx_data
Message-ID: <aoYVS8htMnz8vLQb@rh-jkangas-kernel>
References: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
 <20260729-upstream-ina2xx-in0-curr1-alarms-v1-1-349f7b2f1df8@redhat.com>
 <20260729155254.2C9261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260729155254.2C9261F000E9@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9xyAL6kkew0FeF7j4ACm994WR5qqAoPFTXu_V-NfnRE_1787172175
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jul 29, 2026 at 03:52:53PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> [snip]
> 
> > -static int ina226_alert_read(struct regmap *regmap, u32 mask, long *val)
> > +static int ina226_alert_read(struct ina2xx_data *data, u32 mask, long *val)
> >  {
> >  	unsigned int regval;
> >  	int ret;
> >  
> > -	ret = regmap_read_bypassed(regmap, INA226_MASK_ENABLE, &regval);
> > +	ret = regmap_read_bypassed(data->regmap, INA226_MASK_ENABLE, &regval);
> 
> [Severity: High]
> This is a pre-existing issue, but I have a question about how the hardware
> alert state is managed here in ina226_alert_read().
> 
> Since the INA226_MASK_ENABLE register clears the Alert Function Flag when
> read, does this bypassed hardware read clear the alert flag unintentionally
> if an inactive alarm attribute is polled?
> 
> For example, if userspace utilities sequentially read sysfs alarm attributes,
> could checking an inactive alarm trigger this clear-on-read behavior before
> the actually active alarm is polled? It seems this sequence would cause the
> active alarm to falsely report as inactive (0).
> 
> >  	if (ret)
> >  		return ret;

Yes, the current behavior of the driver is to clear alerts even when an
inactive alarm is polled. This is addressed in patch 4/4.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com?part=1

