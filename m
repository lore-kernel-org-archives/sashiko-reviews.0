Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEF5378822
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 21:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787174463; cv=none; b=XWMSEPQfkh/WNL2cIxzHVfVf5ntJ1er4OYx/uEh1kWxMDDqCRCfm7P5IkotWsP+eoDba12V+zB7lWW+nTP+uMPHhMh+JSyg+NdA0pdxsn5efgEQ1Q75oKWYXEQRNCjEcSye6aSmo94DXc+d7H0XC1P3Xcxvr5UyIenWv/4p5RNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787174463; c=relaxed/simple;
	bh=Ddh9IgjMjq3cGS2HNFSQsJGjI77Bxv1Us66zVXCN2Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=d+QlG/tLQla8N1qvpxK5RbZJKuiJsNvTiX9m/SE8OSWcjUEQ6UXZ2Xaet0HrbbqaN6b6QCUPLSdo7MchiMZRtZllhV/hQN88XHxjgObU4ykY0PDsXpwCE43Zz4/oyNgkAv8rMEURNghft9+pPf542RgAmJd5jKJQc0dfp88X8CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d9Hxz+0I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d9Hxz+0I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CDM5tZFR6oDBBuGDX9cX1nR3t+twNZ0fmFRjBRaqkNA=;
	b=d9Hxz+0I8VwQlJy0of0NoK8s2QiVRLH++CqEMbvj7dd4v1dqUqVZf0H/7YyzDcazSFKbAU
	Px9KmGt28X2ITNqoY6jlKgtTeC+nwEFmokVD0+zLCihJod35DLmb5S6AaH9OspBNw4WL4T
	bqVp5fSPrQls24PExP6Ff4VR8Oewm84=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-hu8M3HAWM2CxkcFR4vIbRg-1; Wed, 19 Aug 2026 17:20:57 -0400
X-MC-Unique: hu8M3HAWM2CxkcFR4vIbRg-1
X-Mimecast-MFC-AGG-ID: hu8M3HAWM2CxkcFR4vIbRg_1787174457
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-904ee4473a8so15724846d6.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 14:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174457; x=1787779257;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CDM5tZFR6oDBBuGDX9cX1nR3t+twNZ0fmFRjBRaqkNA=;
        b=f/KumXlvgeGvCkGQCV/XHTHb7VqQmD+fnKfyl2BaprjH8/5xV2vu5273IANx1Oy5qB
         H43Pwbj22mqgBrZU5WQS0wiJm2fZ38VaSwxtUsuJA5LYoIe0bG1MRhnLSmaXlvLkyjgB
         qkmBr5XHqpIZP6gWeGGTf9OqTx7xcSXkl0TADh2P7JTdXHwggazGE5WMonS6PcwSlJV9
         8Yujrb/33GdBPU9CHuwAQ62rvKWNXgwG8ui/mCxnu+UwLlWFo2r1IWWyRDf1yGS/q7ds
         vd1TG+qXEmX1auq0+Qvw0nRWp17IImiR46ClTOhz7sIiuM5x0+P+siG2MNKM0y8IMsU0
         9S/g==
X-Gm-Message-State: AFuF++kGQPmytUIpsELghv/cjsMZfoP0v8UviG5U5I4dbrnpmXCP4yv+
	ply+Hq8JLBfgJRekvlfovJrciCNwbgxCV9WBPliLftgrLUlneg3F4vvOZ7q3MEIM4RAhljJ55jY
	c0hiD4kX+fZItrIhVRTwqjQh7fF2higVbOYKznVt6LUtbId1uHBG3NDQ2IFFl5U1se7HfSkPRak
	iUd/lWZJIhSIuGV7eB1/TNq5IoG7U+UKyiiKorw+ZUDzl+Ukc747JH
X-Gm-Gg: AR+sD13EwFi0LqjBw9E5LiUcTq2X1qa6s8mHNYLO3X1WnxYvdvfF8PeA3reJdDnsc6b
	hJUvu3jiB0f41bGKd85u6c+iBDRiw9+EV0KcmC2p5X09U3S2U4nhY40UI87Md7FKCw1yySTnR3k
	Eboq6cE0L9KcU7xPym+PSzL9Mzuem0uMA9+FdmhkbGWHGbZlbPfP7alvJ21Ocpp7P6ndObXCMcq
	P94Rvh/gEVaH6VNSy8owqdv47vmOb6z09NqO+ykMLyV38B4mXnQ1qBCEldnX4CxlOHxel2Rd7P1
	zHoKuQiDh6+mJC6crmNiJaucxjoGaaEDp08rDrluiy8vnCV7grPZNQC90MbKTlmY3B3xjGM0LYG
	jHR4wViEORw==
X-Received: by 2002:a05:6214:5091:b0:8df:10fd:93f with SMTP id 6a1803df08f44-90c5e72dfc5mr72345506d6.12.1787174457206;
        Wed, 19 Aug 2026 14:20:57 -0700 (PDT)
X-Received: by 2002:a05:6214:5091:b0:8df:10fd:93f with SMTP id 6a1803df08f44-90c5e72dfc5mr72344966d6.12.1787174456700;
        Wed, 19 Aug 2026 14:20:56 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2a366esm23549196d6.39.2026.08.19.14.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:20:56 -0700 (PDT)
Date: Wed, 19 Aug 2026 14:20:53 -0700
From: Jared Kangas <jkangas@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 4/4] hwmon: (ina2xx) Return 0 on inactive alarm/limit
 reads
Message-ID: <aoYeNed4r3yLVhJD@rh-jkangas-kernel>
References: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
 <20260729-upstream-ina2xx-in0-curr1-alarms-v1-4-349f7b2f1df8@redhat.com>
 <20260729162836.89BDF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260729162836.89BDF1F00A3A@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lckP1esKiTvlpuPIenLFxD1yO8-jQGg6AXUkjyKNW_4_1787174457
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jul 29, 2026 at 04:28:36PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> 
> [snip]
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but since we are fixing the
> read path for inactive alerts here, what happens on the write path?
> 
> If a user or monitoring daemon reads an inactive alert attribute (which
> now correctly returns 0) and subsequently writes 0 back to it, will
> ina226_alert_limit_write() unconditionally wipe the active alert?
> 
> Looking at ina226_alert_limit_write():
> 
> 	ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
> 				 INA226_ALERT_CONFIG_MASK, 0);
> 	...
> 	data->active_alert = val ? alert : INA2XX_ALERT_NONE;
> 
> Does this inadvertently destroy the configuration of the currently active
> alert of a different type without checking if the disable operation applies
> to it?

As with [1] and [2], this clearing is documented in
Documentation/hwmon/ina2xx.rst.

[1]: https://lore.kernel.org/all/aoYYxM63yFRgrxFD@rh-jkangas-kernel/
[2]: https://lore.kernel.org/all/aoYasBdVYNYa1OBB@rh-jkangas-kernel/

> 
> [ ... ]
> 
> [Severity: High]
> This is a pre-existing issue, but I noticed a potential overflow when
> calculating power values.
> 
> In ina2xx_get_value() for INA2XX_POWER:
> 
> 	case INA2XX_POWER:
> 		val = regval * data->power_lsb_uW;
> 		break;
> 
> [snip]
> 
> [Severity: High]
> This is a pre-existing issue, but could we run into an overflow on 32-bit
> architectures when setting shunt voltage limits?
> 
> In ina226_alert_to_reg():
> 
> 	case INA2XX_SHUNT_VOLTAGE:
> 		val = clamp_val(val, 0, SHRT_MAX * data->config->shunt_div);
> 		val *= data->config->shunt_div;
> 
> [snip]
> 
> [Severity: High]
> This is a pre-existing issue, but setting power limits on 32-bit systems
> seems to always evaluate to 0.
> 
> In ina226_alert_to_reg():
> 
> 	case INA2XX_POWER:
> 		val = clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);

These are addressed in e6c80061ca23 ("hwmon: (ina2xx) Fix various
overflow issues").

> [snip]
> 
> [Severity: Medium]
> This is a pre-existing issue, but there appears to be a locking violation
> when reading the shunt resistor.
> 
> The hwmon subsystem guidelines require drivers to use hwmon_lock() for
> attributes registered outside the core info parameter. 
> 
> Looking at shunt_resistor_show():
> 
> static ssize_t shunt_resistor_show(struct device *dev,
> 				   struct device_attribute *da, char *buf)
> {
> 	struct ina2xx_data *data = dev_get_drvdata(dev);
> 
> 	return sysfs_emit(buf, "%li\n", data->rshunt);
> }
> 
> Since shunt_resistor_store() modifies data->rshunt, does this show
> function need to acquire the hwmon_lock to prevent unprotected concurrent
> accesses?

This seems accurate. It's not very related to the series but an easy
fix, so I'll put it in v2 since it was reported here.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com?part=4

