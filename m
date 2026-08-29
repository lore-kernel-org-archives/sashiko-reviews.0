Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE54535957
	for <sashiko-reviews@lists.linux.dev>; Sat, 29 Aug 2026 13:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788008530; cv=none; b=H/LSadPU1RXREofgRSIbV/GbmbPenhACqO+ktuhAIoOhRR1psIio7Oy1BpkNCRkwDV5YHCcl9RJcFY9Y7Z7hke7E49UVQW50ui84O93NR8uICMIQ9kfhl7NrOTTKgEfes4TeMg5jEfo+iWy9wd3Myevr15pkyedU/vLE9uxM/WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788008530; c=relaxed/simple;
	bh=nyKM/IQ76KD+bu3+wq+9rNnOCjc11EqAWBnfm2tDt/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AzCixadEyXlM21elT3z+q3gt43COszm3hvDYrdnXkjngYiwfZKEl/H1Ss+PR+lfNQq55bWDKAqfv7rKpNME4h2dUTK+cxC/ASDg4fSIIGs0B50KpgXufUpAFe00jiKk/vMf/ydEl2X60AogzerCwNO+584bQiyUci9WhGOdzP9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrD8MHuU; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrD8MHuU"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-484362f5c4aso1782f8f.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 29 Aug 2026 06:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788008527; x=1788613327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsKRSFXT+j/ZD+JNjkf8Ro9fgyDxKErAM9cXfCTVDKk=;
        b=WrD8MHuUe3cFNQ613HVHyuJ27dojjstTulMwclcqpC0WUV0ydAgqPDESzzNweb9MXa
         ysVNydJARTVkqOF4ws42AOaK8Wt0+tDzE1mFOI+C0oagDaCJSQ3cyXMwn8BSfq6C03hO
         cM6/PfNKM2kf1NOmd82ZijEAcMf83Z2xFCcOnZW4oJ88EwR6HMhFHM5DXFLiD1TajHkH
         YKRaBdRPJN70+UeEaoEVQ0FN5xWCkUlQmjWl9Uf+kjJsyyuWK64izDeCG0QKLyU7ATTp
         flYfqxZSYM3fC5W39BM6DG6myO9MXd+chj0T+KzAjJ65hfkILARAzuX+PnPGzdJshSxF
         MCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788008527; x=1788613327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsKRSFXT+j/ZD+JNjkf8Ro9fgyDxKErAM9cXfCTVDKk=;
        b=EjPRDWyD4UkzQRBdA0Z5iTSboQowgxzFSZuZPcWb7utdh5bzYXfy+x+VlTxYKOvAyY
         kRcvwgHmQ9oH9rF0Xzt+nGAyTCVCXTVfFZEaHMAen3eo3PP0frPQcTYHzOgtZ4AyGeoM
         C3T4NnGi7w+fPXOIXOWT2x/S/7U4ktFLvZIWt77P0g+PesYXab2lTm7kjD9pCcS8INls
         Ah2mY/dvLVGlM1x+TgVb25lUyi2kZjSPQLS/5xwgt+oJ+y2zocfjZdczw54yngMRfhRg
         9/h3L4OxsMfUaD7rdGZiiLvVPirspuRHlfXKBkJRSBwf0rfRFxBqrwo26bpGyES2igIv
         GPgA==
X-Gm-Message-State: AFuF++l9qHDSRKj6IRXxa04QKEUATENaUrj402vsgvxyxF23esJOyqcw
	1ben0efh2ov1EpcvKoqpryN5Pz7zNHQHBMgPW+dIv609zkmp9/hpulRk50ZAXL7ySVk=
X-Gm-Gg: AYBFou0Tqpz3g5OqBdZE1Y9hmaqL4bfwir4BkZG2W7Yu6ufvpM9dl09777F6uCm5Rbn
	8vMviyASbKI3CXjY3wV2Ic0i0ucdCqrp966roeU0PcbxGpAuYMn68bzZPnu3yhmnepoB5bk3DH2
	SB5c8KdADKtJOZnZLAtbLQUrO7UWHTDmPxVnRPsqXGghrqaPan9n3s8n+6Dh6l3qji6BkkL+STu
	t8Q+5iuwcNYH4hdpWKWVix+/ftZ2GXJ9kPZj5jDIWwA545HiufUyG4prQ+qDXOIbDBa0QL8RcZo
	Pg6XeZu13Z9/m9t+UiEdc8QqKoI8nTNFhCn3ITZlEajejIvq8FcDv2MpzB/Gc5d/H3Z3cENlldt
	CojQY8EiAaX5Z+KtSHfHqMjg8fi+715fKTrl5Ldh1yEfUxkYclD2ZIBJH0iMPPmGC1EKUSglHys
	iVC0wYuFloG0oUn/MLtXA8dIIJZBxn2MblVHI96gNvCz9yQU5cjcw8TadgLLPc0w3WLypwNyxOx
	EIm47b8E14KrqW6KPYLkd6R0yX4myTL2iParqE358+rydHfPw44IEaL/bnH+B0cTtEpb1lalcfg
	S0CD1NNQ4mlGmHs=
X-Received: by 2002:a05:6000:18a6:b0:482:d900:6558 with SMTP id ffacd0b85a97d-482f7984d0dmr18161892f8f.7.1788008526497;
        Sat, 29 Aug 2026 06:02:06 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb27941sm9582740f8f.27.2026.08.29.06.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 06:01:59 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	media-ci@linuxtv.org
Subject: Re: [PATCH v3 2/3] media: i2c: Add driver for OmniVision OV32C4
Date: Sat, 29 Aug 2026 15:01:57 +0200
Message-ID: <20260829130157.5859-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829121613.686D41F000E9@smtp.kernel.org>
References: <20260829115832.8749-1-robertbozik@gmail.com> <20260829115832.8749-3-robertbozik@gmail.com> <20260829121613.686D41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Aug 29, 2026, sashiko-bot@kernel.org wrote:

Hi,

Thank you for the review. All three findings are real. The first one
needs a different fix from the one the description implies, and I would
rather say why than fix it quietly.

> [High] Incorrect error handling of pm_runtime_get_if_active() leads to
> PM usage counter underflow.

Confirmed, but only for one of the two cases the negative return covers.

pm_runtime_get_if_active() returns -EINVAL when runtime PM is disabled
for the device and does not take a reference in that case, so the
unconditional pm_runtime_put() at the end of the function does underflow
the counter. That part is right.

Returning the error early would break the other case, though. With
CONFIG_PM=n the inline version in include/linux/pm_runtime.h returns
-EINVAL unconditionally, so an early return would make every control
write fail on a kernel without runtime PM - where the sensor is in fact
permanently powered and the writes are exactly what should happen. The
drivers in the tree that use this idiom (gc05a2, gc08a3, imx283 and
lm3560, twice) all let the negative value fall through for that reason.

v4 therefore keeps the fall-through and only drops a reference that was
actually taken:

	/*
	 * A negative return means runtime PM is disabled for the device,
	 * in which case it is powered and the registers can be written,
	 * but no reference was taken and none may be dropped below.
	 */
	pm = pm_runtime_get_if_active(ov32c4->dev);
	if (!pm)
		return 0;
	...
	if (pm > 0)
		pm_runtime_put(ov32c4->dev);

> [Medium] Missing colorspace and format field initializations in
> ov32c4_update_pad_format().

Right, thank you. The fields are left as userspace passed them and then
stored in the subdev state. gc05a2 and gc08a3 set all four, and v4 does
the same:

	fmt->colorspace = V4L2_COLORSPACE_RAW;
	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
	fmt->xfer_func = V4L2_XFER_FUNC_NONE;

> [Low] Missing stubs for ACPI resource functions when CONFIG_ACPI is
> disabled causes build errors.

Right, and it is a consequence of a change made in v3.
acpi_dev_get_resources() and acpi_dev_free_resource_list() are declared
inside the CONFIG_ACPI section of include/linux/acpi.h and have no stubs
in the #else branch, so with "depends on ACPI || COMPILE_TEST" dropped
from Kconfig in v3 the driver no longer builds without ACPI. v4 puts the
_CRS walk behind #ifdef CONFIG_ACPI with a stub returning 0, which is
also more honest: that lookup only means anything on an ACPI platform.

All three are fixed in my tree and will be in v4, which is waiting for
the rest of the review of v3. Rebuilt and re-tested on the machine after
the changes: the sensor probes, streams and the controls still work.

Thanks,
Robert
