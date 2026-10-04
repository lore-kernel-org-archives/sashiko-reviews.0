Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8CA54774
	for <sashiko-reviews@lists.linux.dev>; Sun,  4 Oct 2026 08:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791103804; cv=none; b=HPrlU7D0RhQzmYkGaENq+sTT8neI/Q4eQIvKGLvd5UKg99K5uTe76YfbkcjK1YdOpKLL9LsTh3cxxuHv4XY+caAA5ZpbFbeEclwTla1nJPpf1/06NWRBltNeX//TLoLe493DDvmRaLZ0iUAEQ8TejyLWMjHDgjHYTMYqthUW+6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791103804; c=relaxed/simple;
	bh=TBLGnJLwIPub+jgduJVfPnz8P8wgTaw89DxN0dlS+ZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fy7iFMwp1Xf+gTZ85RrIWVVnRAbPbdbaejbB+Zq+Y9PG2k4gf8NEVPxdd23qCx8dtHlUBmnAQQwIkZjpu66dOWf1Bb2epuw8mrSrtDzwknnket4DuCdAgB0sghIYXQkc1Z+qk6Iuag1JS5Twka6MScqk709ksR3xQgD2NXlEdew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6t2lKxy; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6t2lKxy"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a01ff8c098so5973095e9.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 04 Oct 2026 01:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791103800; x=1791708600; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TBLGnJLwIPub+jgduJVfPnz8P8wgTaw89DxN0dlS+ZI=;
        b=S6t2lKxyRpOHek6YKUx6pp9/f+btuwd9oVo5f8+jHdbR6rAOdN4BgblCkGNzBssD2G
         QEE6Y9IPTCYHza6W15u94GiE+wRgMGbI84b7soKjJcXOrBPLtcNI4xSa2Ku2loT7dFSA
         ssZsNJkLFrvutccw5s/wO9/oowVwaMJCFAQoGYbRrpMJegWG/9xW2jQNk2JjIy+ZlZ2T
         /0ASL+QRyKhDMMGr+Fy8MmYmf+W5q5DjOZpLLmxeIMHvqd63VyKcQiOc2QvoCqNVJPbs
         /3yT+mjMlmnJDSx7eiI3D86U8HKGnXyKpe4dYHXXBttphV7aQNrsNys+HQcs6uMf0MYp
         OiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791103800; x=1791708600;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBLGnJLwIPub+jgduJVfPnz8P8wgTaw89DxN0dlS+ZI=;
        b=BIxvUD8DAy+jqRVy5TjVBwmDx3NvcyPm8DQwCRVtbDQRRV87ApalsgsHED8kzh/89W
         tf0NaTdGI3sivRG7B8O3np4hwbloDJmWoJIhHpEUJPa6bmUxixUzFR7X7mpOlW1T//gg
         JfreNdNvSaXqlDhiEnbbCLMUj/QsJ06mOYhocEYXO4NnFcs2yHa6WMXqVTLxHHCNPs58
         G0LlDBIwayESaMpLmfEAQxdQf/8dMCZ+9oDaAKyrHhIrpvIfnvyTWu2pbZYd0k0lfhOi
         +iEsruVusZclDrOlGn2fwlzA9Q9maLqqQrywNtuoDMUalK0R16HpNQb2nXGz4TtrCWWW
         grLQ==
X-Gm-Message-State: AFuF++kAkF5YOfjPLAr3wDR/xISJh4BNXsNKhIha7FUVkjAibF8bcdIN
	Txjstc8zD6KrtpMfnyRPpaW5hCx47giSrbrNg674bJmQuGacJqTcj5+T07cmeQMm
X-Gm-Gg: AYBFou0Qd0z/VLjuo3KtESdeRrXqrtms/VsCMD1lxQupMGX62y7TedDbFAF74txZjaO
	mzeikKFXn+Afq1CsvY0Nu4JBN+gXs/AdCkScTmeIjt3XeB3pXNlHtZ29uaXCP+3nWqDVC10l13H
	EckNXUbLAZgcv7mKh9nZoVZMnoCKsLG333WG4ovoGJBU8+gS7HLgvb2m3xEUhWHMCURUBX9Khlt
	K+gQUH1je/4XOtRIeLFMFNd367oRspAZrGlh6FQY6yHxfTbs7gouZQW95oUCvSyRyH4LZ9c6KpB
	hkCjL//eQc+ENhVuR8N0MW3MkSL/DaRjENiSSK89nmUV8cTbbiMKDq1oXMBuBYcCFmSIx+1zpyS
	wBdmJJuz/Uocp+idvIQoLvLs4ctsfvSNlDWIlotVGaypFVB6ieomgbCCp2RC6fV11ZyCIN12h6y
	WtxMYuJsMwxqYzgs6ynasJFSMBvHftDDnQ7n474TnyHNOItKOU6PopwIw+eb+02kWyMpeu03b9Q
	CcMr8v/QbnKruksWRIF/zidOgFb4JHaGsOMzDG5CZWUP36LoaU8MQ8+JoQ180vEsPnSViNl05cl
	cml0
X-Received: by 2002:a05:600d:6445:10b0:4a1:6d21:93c1 with SMTP id 5b1f17b1804b1-4a16d2194fdmr27595865e9.16.1791103799699;
        Sun, 04 Oct 2026 01:49:59 -0700 (PDT)
Received: from localhost (p200300eba703ae00ca7f54fffe019321.dip0.t-ipconnect.de. [2003:eb:a703:ae00:ca7f:54ff:fe01:9321])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c57d9327bsm2076646f8f.3.2026.10.04.01.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 01:49:59 -0700 (PDT)
From: =?UTF-8?q?Johannes=20W=C3=BCller?= <johanneswueller@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [RESEND PATCH v2 2/2] drm/amd: fix HDMI signal type for EDID overrides
Date: Sun,  4 Oct 2026 10:49:57 +0200
Message-ID: <20261004084959.1441071-1-johanneswueller@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175619.722451F0089E@smtp.kernel.org>
References: <20261003161525.23600-1-johanneswueller@gmail.com> <20261003161525.23600-3-johanneswueller@gmail.com> <20261003175619.722451F0089E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 03 Oct 2026 17:56:19 +0000, sashiko-bot@kernel.org wrote:
> Could this override check also be added to rgb_output_is_limited_range()
> so TV formats correctly output limited range RGB?

Yes. In v3, I'll move the check into a helper and use it there as well.
