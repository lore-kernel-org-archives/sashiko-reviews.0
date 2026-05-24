Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18456397350
	for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779636365; cv=none; b=qh4GZflM96pcGcmuJxro/BP8kpN/kgd2TS2pIArLOrctDPLL6rB3NQ5iQEM44DtXq2M9pX77bTpKMKow5Vf726bJUmFk4w/WL3i8O594r8XWweybj549fvN3eJpuxgG5y8InaXcA1I2Yw8X6oYzsr06gvNwQ291HcO+edwId6g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779636365; c=relaxed/simple;
	bh=endhtLMwREnMrpsK9d6pveIWZYHLz6j+UumURqVqXgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIpGhlWfMYD9nV6S0Wz4rPPItQihZyTUKK38WjDSVNJYaDykg1N1zcVTXU60tEUeFvKmzq1Q5WusS5J3Ifg4lueANicY4pvITSfJCAj/JGBYsMJgLrWHDpKwap5IXZ9XkEaWZlDYVcEdKx0H6m6jZLisqFO2QkEt0jIURPUIWbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avaQWnvC; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avaQWnvC"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2f7020a928eso12832703eec.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779636363; x=1780241163; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vd80g3kYCb3Gm0irbMYMwyAFrBdTjDNomWG6QQeh9hU=;
        b=avaQWnvCXY04TJtzPAAtrLPUnvBHZz9hZ6UUWuMha0nTHWlLioWQvcB6CEzrJZqiBN
         wWZ+gYmq9i81rk9cBNTYNh2pRu06iXzWM7eTahkQZTbIqdJ/e1YSYvhWxIAJABqvr4Ym
         KFzHypS/z3St9TAgRvY2GXghi2QeSwXnq1HDOIYRwy8FRzf5Q1a56kzFraTfhaIRkw/J
         jI5V9dodIax7EUpZmGa0RUT2+NCpKjaxn9Y1bzkEVZOow5f+eomgAdqZlGEGFFfNu/jB
         bxHf4h8g6Xy+FQO8Sa1cQ1boS2wGIHYKrHPtAhcuI0pabWDPsYn7qP5mnmIpHEu8/AJ4
         oRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779636363; x=1780241163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vd80g3kYCb3Gm0irbMYMwyAFrBdTjDNomWG6QQeh9hU=;
        b=KP5hMsLSPnBbjhSd1PfV9k4Q7XEkrTZpK4pszcVGz7FnQ5bh0VefkrfUrNe5+yK+fA
         ybyddnJt6EfBaMxM6+GAYejaPvoAHsHBIldSmn9IrGOyh60Oh9HGQQizmny9NAPF5BWR
         tIPwxknlhvLHVNEa6VJMRgkSyIw+m0wJfqW+uPat3fQtgb+8OSW8Xqrc4DpgV4rabJJg
         HHlWvb7/nI3n7Vmf6VQNaUGGCzYZfafkgHkcbtcxo6Gz6x2x6vGtD23X41zP1j0BQhdO
         AC5vfGL1kppLMBCvLNID2c0Oy0N6iiBO7GB7BBf7nwFz54Hwf0Ce3xAVDeed7NYHKGRD
         AkBA==
X-Forwarded-Encrypted: i=1; AFNElJ8Bc4OqcRJhFz/UUi7K9Rvi+TIWtG9Sk9XJlA2PoUeR+LNIBDttbPVUUKxlTejfm7FFsATL73UMc3ZMzg/JlK0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLJ9jRXkOmsvd0nFvICGKaF0uvSBlEcNkiPxTFnG55kPPp0fRt
	HyYAVE/SSaF5h2xVOnKfB9Ujks8l8njaydn0Hy80DjzTZqscOS/meRRH
X-Gm-Gg: Acq92OH30AujgGCDUAAeQJAzXvfZDak4Q3iRJlasXJ8OOvXlcDb7DeSSctdWIiQy5vr
	vdagT14ODC2ws3VV/N9iDc09oXXTiWmjre8ity1YV91E34+KYf36pr8muN5bPsHWRq9VASZ+ISN
	YTHTwVWkiTSM2XqC0JylWSHfD5qn++Vmd1d27sMlWIKTo/NUKQPMj0+skpdRuQwFYxfhVrpta0r
	uZ/p8YtlxFzem0+MMqYaC7OQLaq/DaemFt3O4JLM/JYg8HLVOiGaftSVB5SyJWj693VSDI8hGdh
	43jfM+eI1Iu0AZ1n/UpbDkqCmPTBy1X40DmlWsWRw/5xKYGz1fikmtl2273iglzqyEOhpObKukd
	DzQYIIeMDBZGTkMl4lCxiRtCU+MxGsnxUgq2udAJD3p5Rh7ILKKjdvs+U7NPwFr2q1+aSvvoak8
	k0NQduAgMlCNJMh5AqdQDyEkaHC/hpXHHKHaNC9heSyebyaUw=
X-Received: by 2002:a05:7300:ad30:b0:304:70d0:4f07 with SMTP id 5a478bee46e88-30470d05c96mr1710201eec.17.1779636362636;
        Sun, 24 May 2026 08:26:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045225b7b6sm7935559eec.25.2026.05.24.08.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 08:26:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 24 May 2026 08:26:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jan-Henrik Bruhn <kernel@jhbruhn.de>
Cc: sashiko-bot@kernel.org, linux-hwmon@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v4] hwmon: (lm63) expose PWM frequency and LUT hysteresis
 as writable
Message-ID: <d0694fe0-16b0-45f9-b6e9-12733d489f67@roeck-us.net>
References: <20260523105837.67B9C1F000E9@smtp.kernel.org>
 <20260523133617.3439102-1-kernel@jhbruhn.de>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523133617.3439102-1-kernel@jhbruhn.de>

On Sat, May 23, 2026 at 03:36:17PM +0200, Jan-Henrik Bruhn wrote:
> The driver caches the PWM frequency register and the CONFIG_FAN slow-clock
> select bit, but never lets userspace pick a different output frequency.
> Add a pwm1_freq sysfs attribute that selects the closest SCS + PFR
> combination for the requested value in Hz, gated by manual mode like
> set_pwm1(). PFR is clamped to 31 so that 2*PFR fits in the chip's 6-bit
> PWM register (matching the existing scaling assumption in show_pwm1).
> 
> The hardware LUT hysteresis register is shared by all LUT entries, so
> the per-point pwm1_auto_pointN_temp_hyst attributes can't be made RW
> without N-to-1 cross-attribute side effects. Following the max31760
> precedent, expose a single chip-wide pwm1_auto_point_temp_hyst attribute
> holding the hysteresis amount in millidegrees; the per-point attributes
> stay RO and continue to show the resulting absolute trip-down
> temperature for each entry.
> 
> This was tested on a Linksys LGS328MPC switch hardware where the fan
> would not spin with the default PWM Frequency, which is why this change
> is required.
> 
> Signed-off-by: Jan-Henrik Bruhn <kernel@jhbruhn.de>

Applied.

Thanks,
Guenter
