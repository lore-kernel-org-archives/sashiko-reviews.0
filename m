Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DE9376A0B
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 20:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787173068; cv=none; b=Ykh7+w5cRnqitYkkCFVOoOn95jta3Q2uAPnQVtzzmIVsBI9OoPJgG1mpY8WnUYwNy+pO9MjJOSZ+HgNjcTcJFl+dbya3/CkfEz6iAegFleLdTPuNH4DPBWVa260RXE19gbsBMrN67aX3tw8W3nCL+DSUMve8jWTehGVKek5jd+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787173068; c=relaxed/simple;
	bh=gDfua+9ShagUuSPzMUyOYe1EpfBoD5A1A4oU+7lt6CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TcuHHc3D9Os44JERHVB4+KaZ+Vkm5XRPXm0gJbtp9tNWXOpQbGnt4NdsQoWDSNjCx6NUeO5jk2uALs1WLVMGEyxibGCyHug2JQlTDj4r/hdBHpfhtpKEtL+Ywp7Bh5a+lOaZdSJSiCTSHaqn5WtNMYfi/2kHw1bYHOXPu/RT/5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RtnWOv7O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RtnWOv7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787173066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HB6dtIzqksVtqcu2PuJ7X1T6+4gFFyG8eD+zoH9sLuc=;
	b=RtnWOv7OFN+GeseQkf5TUyRFIWSkqGJUru6FEKzxhkjWScgguIZApaYPmN96mTCmb6Ed08
	MVnXDoVCnhDbXAaanTwd+7KCX9WfgGkpF0HqQ2aRZiVHkPFA+/Yup59/uwf7VwGZa09kdp
	1LuhLsfiZeb3quHguvLuzgTgYpsYzfI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-MURqyevINmOEayREV9xNfw-1; Wed, 19 Aug 2026 16:57:44 -0400
X-MC-Unique: MURqyevINmOEayREV9xNfw-1
X-Mimecast-MFC-AGG-ID: MURqyevINmOEayREV9xNfw_1787173064
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e8004d60eso279309185a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 13:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787173064; x=1787777864;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HB6dtIzqksVtqcu2PuJ7X1T6+4gFFyG8eD+zoH9sLuc=;
        b=gFBYIUu8LU1lEz0pKTn5njxmqvLyh1JehpPO9txL4N1zCcFRcgmvdPI9oIa/RiQ28c
         rPfYfP5LeAti3lF9jK+ZeSGPtXBFb2k/0DIRK+kWSyr1OE+K1EvGfBkY24drxDtpCKja
         baJhtUziyWXK+hWsrbuaUvx6m1EvEuhkj3vHcFae0iVi9efKPy/J7ullOzPprdDMYukU
         Jw7DlKsMM6nQ2YKCG6TJne9KJVJSjC2t8uDzFtx498/iSNocwosqgOe0NThA3kULwyir
         tcSUXhZbbF5fxqKD/Kmacwh3G/NP2ry/8RRIacyPPG0qZ5hP1qh+ypnztbkzXA9TaGfA
         TbZw==
X-Gm-Message-State: AOJu0YwWHjlXNxeghev1sFcUhAbs/I3eoxwkZ68/wnc85WXh/yLKZ3WK
	DMnybKEdbyQj9nc0qbqP3EEKMAzBdUP+W4nAZn8kzSrrOfY64qw7hZ4PmTHruPKETHowTVBkLnn
	d7R6+eOBk/iaEBuppAtBKpRxRjrZgEt2+0Av8RCOggZls5ifpWLDcIKzSfgV1Aq7S08EsT7HB4o
	Q0cd3gl2HDafXiGiIVM1h1ZrBDjeDgapr5oxdjh+OzZ2o9rBGiqCiN
X-Gm-Gg: AR+sD12qgsJICGgxTHbEYAjeW/GYb7igondNGJ6FMdyIy4ftW66HnwRB7hI1X9dSSfR
	lGq2fTIjIzJGQ+u4hzn52CUqCbL0wkmn3yD0ApQSRa1+RT2GAW2cIjAuqFBiSbW6azs9wfpTB6W
	Km8yKYRHXa5SSAtSEmcVciuS2ZkFX0lUcLeWK7rZXHaf3BkjuVDgQ/M07weW7J0WyYvKtXDphtQ
	JhVkMiGr1r7mv8oqZ1OkZTwFSjpRo8aDoj28N7e+vobt9+eagrSbSShHvoPdvM+59MILvv+cKN1
	5zJkSFei8heRCMDPevyn0lwlXEHomqF2LVraJlX/fPVURosBD0zm4OgfuIzngbW7HSf73qIi3uF
	z1HAqSgldkw==
X-Received: by 2002:a05:620a:a40a:10b0:937:27fb:96f1 with SMTP id af79cd13be357-93727fb978emr207460185a.43.1787173063749;
        Wed, 19 Aug 2026 13:57:43 -0700 (PDT)
X-Received: by 2002:a05:620a:a40a:10b0:937:27fb:96f1 with SMTP id af79cd13be357-93727fb978emr207455685a.43.1787173063250;
        Wed, 19 Aug 2026 13:57:43 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93720584d5dsm218840785a.36.2026.08.19.13.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:57:42 -0700 (PDT)
Date: Wed, 19 Aug 2026 13:57:40 -0700
From: Jared Kangas <jkangas@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/4] hwmon: (ina2xx) Replace masks with enum in alert
 functions
Message-ID: <aoYYxM63yFRgrxFD@rh-jkangas-kernel>
References: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
 <20260729-upstream-ina2xx-in0-curr1-alarms-v1-2-349f7b2f1df8@redhat.com>
 <20260729160250.7FCE21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260729160250.7FCE21F00A3A@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T0ucSFj5QY_3sPYsYnivGu9pDPAJPEAYjNNxTkgJC2Y_1787173064
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jul 29, 2026 at 04:02:50PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> [snip]
> 
> [Severity: Medium]
> Does this actually distinguish current from shunt voltage alerts as stated
> in the commit message?

No, this patch is intended to do some replumbing to make the fix
cleaner. I could see how the patch phrasing could come off the wrong way
though. I'll reword this in v2.

> 
> By converting the enum back to the shared hardware mask here and in
> ina226_alert_read(), and not tracking which alert was actually configured,
> reading current limits or alarms via sysfs can return the value or status of
> a configured shunt voltage limit (or vice versa), yielding incorrectly scaled
> hardware measurements.
> 
> [snip]
> 
> [Severity: High]
> This is a pre-existing issue, but does ina226_alert_limit_write() reject
> valid configurations for reverse current flow?
> 
> The function explicitly returns -EINVAL for negative limits:
> 
>     if (val < 0)
>         return -EINVAL;
> 
> This prevents configuring hardware alerts for reverse current or negative
> shunt voltage, such as during battery discharge.
> 

Shunt/bus voltages are clamped to non-negative values in the driver, so
this seems like more of a design choice than a high-severity issue.

> Additionally, if the limit is exactly zero, the alert is not enabled here,
> which makes it impossible to trigger an alert at exactly zero.

Disabling on zero is an explicit driver choice, per
Documentation/hwmon/ina2xx.rst:

    Writing 0 to any `*crit` setting clears all `*crit` settings and
    alarms.

> 
> [snip]
> 
> [Severity: High]
> This is a pre-existing issue, but can the calculations in ina2xx_get_value()
> and ina226_alert_to_reg() overflow?
> 
> For large limit values, such as a 200V bus voltage limit, the shift operation
> in ina226_alert_to_reg() on 32-bit architectures:
> 
>     val = (val * 1000) << data->config->bus_voltage_shift;
> 
> yields 3.2 billion, which overflows a signed 32-bit long variable. This
> results in a negative value that gets clamped to 0.
> 
> Similarly, in ina2xx_get_value() called above:
> 
>     val = regval * data->power_lsb_uW;
> 
> the power calculation can overflow a 32-bit signed int for large regval and
> high power_lsb_uW, returning negative power readings.

This is addressed in e6c80061ca23 ("hwmon: (ina2xx) Fix various overflow
issues").

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com?part=2

