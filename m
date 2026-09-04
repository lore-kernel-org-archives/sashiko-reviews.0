Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18B647F77E
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526682; cv=none; b=a2T6/C1kBGjXQf0aRy9CYZT8/Bhu6g7auWGEFUVQFxl9r7q03uGlckLjeDKklek+o+SiQh3Zs+tcgc0ZRbCHA700I/YEyXFKj+zufLPvEJX4jWtsZK29VL3kaIW2BqCB51+3uyErW9mQS5dvE9lnFYeCbOh6Km6wwUiXieZI6tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526682; c=relaxed/simple;
	bh=/u7yvYvbT44iz4P3NSPmATvikZpCTdXLDwh+z6TVtbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZyHAHWeiZe4YvP+IG1+xnClb4CHAtqRmB86vbbpYohannieB+3tcKOciWrmjB7WknxIA7eLVKiZPP6vd5NISz/3h7lMCU28EzCRrGKX5iJRVnPs4UWrFNhhyJwUi0gLYzCRg+Tn3+Z2Xh+wQQEgd3mJEFEnZ5W6Ee4aMgz2Q6dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nA/+fYo+; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nA/+fYo+"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1000976a91.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526680; x=1789131480; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a8cAPX0qoNPrh55TaKC4p5HikxGn38nOetRwDMVXORs=;
        b=nA/+fYo+1XB2t55cvQaqHBCTY4ElTLYPIQXMQrUIjEudDwk0tWMYaY2Oc7bz4NDNGY
         11qeI++l6gxgfwKLytvKeCdspz+MdmB0/lrmSPqc2ckpOrDx8dj/U8Vpmnr5Tkvlk9vr
         4rdIFGvUtcSI584aFrls+m1ss/78c2anYZMnl6i5DFHaMiPglIedRXfGGCeVeZp7gXlN
         NkV5ej34lH56tOQMVu5xCKd1wEDruHoYP+QI2R5TLFWjOJ3X4flxpUHMWkA1QkcOdKTl
         007P6GZ9m6OLff47QSVZj8pr5hSIMGLGwTD9wqQUcmtKucwOlh+009XvppONLkZW73EE
         WX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526680; x=1789131480;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a8cAPX0qoNPrh55TaKC4p5HikxGn38nOetRwDMVXORs=;
        b=PT+kOY4vQufZ9SWcWfWaJzpb1bLy2fv1MqIh6PP+cyLMN6yffaDVRyJbWcKCnUdpjH
         uKt/92xbqgtAHUwEioKQATZvKmHJAfTx/hcPsLTmt8JA7kzyg9nbkxwmiqHKFKqMk/2q
         /vUWM4VuSCJWhAkvCRenqE/u98yoN4/LUXtJRJ/q9MGJz3Sap/tmSS/LicRY+oFe0zru
         wlGfYvIk/UiSONv3D98D4er4407au0We0weu29TxKfOOwoZ/cqM1robU9Byxiyb+v+Mv
         CA/lSAtJtqToIENS/a56D7hEOyzN/mMl7lHsws8DNdZzhK8jlOIf19vhQqW59GEn/Dqf
         zF0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxJvrBqO1JOTsJ2evucbCkfKp/TnFlCQQ73EF4O6DKiWWYP2GTonug0FtCai5k+7ZDPvpFpOYHiBMJc7IZHuu4=@lists.linux.dev
X-Gm-Message-State: AFuF++mflNhp4Bp1UTj7NCfNQDUZcGHFU7EIpFmWMTVQrcEInPm1e/dp
	9GAf1N9MAQ3AcTNNVekpOVLJjBNBGCpFkqi6f+qxpwcEzlw3+wl+bdHw
X-Gm-Gg: AYBFou1A3x6lowS1ta+YlFfwjNXdzEJNsK7DpzQvAg2/TKKzJpRHW2yxoExie/DIq4h
	y5NnM+0+E9POE/P2T6xQXSN0H4rujsANelW8UVoA06XhqAm1ReiPLjCRuMNaVQsmsQHreKDsUs6
	Z1qmJh0jEl2cFgCxKjMQ7ezVcYH4iYbQahlbs5sBmh6cmqbMQmWHDse4tKfE28h883J91pg6FVz
	tGUYml4ZOnLUDGLUPpGe/TlUyeGWbK7ik80/RGrIfG+PzniJ8CjoaPKoInQ7wpQZ4ww7Q59nJwr
	WTx70MBHJi6FvALndV5K9FVyMJIsYQ4rdncRe/XEG+HkX2Si0nhG7xCY8cVe6lJYQcjzgM3QmsB
	b7CiOZiRNubcihgNSn16q9t18yXT5RcerT+NixwmZUES46MZh5sw04lvSmTAM4FxsZn6fQfgjRs
	RnuWNHlnKEe+FDz2B1d5SBCZ+5ZMaAzfoX78lKwKvQsmgUzbzkwXXFF+V73c46+aLmbQ==
X-Received: by 2002:a17:90b:5866:b0:398:e73e:5a13 with SMTP id 98e67ed59e1d1-39b2613272amr8567041a91.9.1788526680063;
        Fri, 04 Sep 2026 05:58:00 -0700 (PDT)
Received: from [192.168.71.146] ([240e:b8f:91e2:d400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39451sm10720102a91.7.2026.09.04.05.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:57:59 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-scsi@vger.kernel.org,
 sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH RFC v2 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED
 driver for ROG NVMe enclosures
Date: Fri, 04 Sep 2026 20:45:00 +0800
Message-ID: <202609042045.ReplyLee.lhw@gmail.com>
In-Reply-To: <20260903161357.GX2133376@google.com>
References: <202609012200.RFC0.lhw@gmail.com>
 <202609012200.RFC1.lhw@gmail.com> <202609032000.RFCv2-0.lhw@gmail.com>
 <202609032000.RFCv2-1.lhw@gmail.com>
 <20260901145204.2BF551F000E9@smtp.kernel.org>
 <20260903161357.GX2133376@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 3 Sep 2026, Lee Jones wrote:
> Please review, explain or fix the Sashiko review(s).

Fixed, fixed, fixed, false positive, false positive:

- [High] empty work run writing flash: real. The work now snapshots
  the dirty mask up front and returns before issuing any SCSI command
  when nothing is pending.

- [Medium] name collision between enclosures: real. With the static
  name the LED core would register a second enclosure's LEDs under
  renamed nodes (led0_1) rather than fail, which is still the wrong
  device identity. Names now include the sdev's H:C:T:L, which is
  unique per enclosure.

- [Medium] colour write vs dirty bit ordering: real on weakly ordered
  architectures. A per-zone spinlock now covers the colour cache and
  the mask on both sides.

- [Low] blk_rq_map_kern() argument count: false positive. The current
  signature is (rq, buf, len, gfp); drivers/scsi/scsi_lib.c calls it
  exactly this way from scsi_execute_cmd().

- [Low] kzalloc_obj(): false positive. It is in include/linux/slab.h
  since v7.0.

v3 with the three fixes follows. One question in its cover letter:
whether deferring the Kconfig/Makefile/MAINTAINERS wiring to the
agreed SCSI split is acceptable for the RFC stage.

