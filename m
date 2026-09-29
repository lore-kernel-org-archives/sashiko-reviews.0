Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD78B51E42F
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 16:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699260; cv=none; b=PQcrRW+Z7CGa/nPhPLeL+CVPU0xr6ICvazgp98KnMmrm/f5lBOCCksrZ7463hvRg2O4Iz7k7bCxfUhW/c/3DQrJyz+d5nAWGQ5q/y7XWdEaYO6zXbhwRB7+36QTQQpUZIyfZCeAGwDmJkohqTQOnAXZom59IfNwCby1Rwd6WMnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699260; c=relaxed/simple;
	bh=PMX1p5KQ1LljzZN0fjjRX/ggRrs5b9HbaoJ5+VgHJlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBRB26g18eTPgxhekuHDtPNB2mxBEEUCnyek/yR0Beo7hQtpGsDatSyo5wLyRU2nfqVILqs6k91KeqjjglaL6d+cLqPqMxXac0GLPJPQfS/IpFczRZ8Zr9FT4EXfdsVygXNlbbViOxrm7airq9GFXVWESgPO43GNnOL+HSCrjOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o79O4+GM; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o79O4+GM"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7cadbe09dso310317a12.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 09:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699258; x=1791304058; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PMX1p5KQ1LljzZN0fjjRX/ggRrs5b9HbaoJ5+VgHJlw=;
        b=o79O4+GMoItIhdzptLylNyr8hWei8uLI9QDad0X14DTMw/OPc3LbVJ8/k9piXr2lN3
         15pUvZSFzUHurxaEcN7H39InNAxm1H/ybftMkzrp19APGu5tokWfQn+zZDxfqLa3RD5f
         mb876p/vcqNHFg0fameabJp0DiFdB0Ad3+fnO6EWo1uhdJnAaB/NRGMOenE476fr/w6T
         joPmoc/vvWFYkvUWXIdiQQzT6hMtTlfsSYgHRV4NK9HEU+7omL4bVuLA2FH033IWCiES
         u7L8XcoVDFTecJl1MdyBplKRpaVVzkxsH+6FvqyPFDRkmLZel1qSZmD3+bjV7mrXDklQ
         +9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699258; x=1791304058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PMX1p5KQ1LljzZN0fjjRX/ggRrs5b9HbaoJ5+VgHJlw=;
        b=AaSglmRtwyIMWdbKnUgha0WnhYZDzGpLf6NXu0V3fe2CVEFcLIQ3bz1v2j0c0Pc6BO
         vu8cG/EuQnHtiaB0ARZ1bYqN1z/8HVYqgzrNl9Qy3eqSuEZp4t2Gra8x3zHGLwXmqHtR
         tHAavXZLjl8RSkq/7j7q7x2oChjMEVlglkww9GTRAq9nx8USlRWzJWIkGxwa1iQt/BW2
         8zVYrX/0cDAwvISYVXfnBF+Ox2yowAw+yXRLR8GVN9l8obXKFQ5Zxxph+PkU0TWHiJS4
         DZGbv972o9RHAGeUI69GA/IIGHVsTwjO5WbFt80CepK1CWtw1k6NIP273e5jviR3PEVI
         WCKg==
X-Gm-Message-State: AFq9FYIm2fc84CL+0r++ppVEUtcPEFG84tmywZkNLwKppoP7UA1SeKu2
	gUaqNLm+hvhMriG3YQ2L8NC9IEfteMoRSdfOgwEjwLLtFxNkcSwzRBgcmIIDpIG6cGTO0Q==
X-Gm-Gg: AYBFou0A2EjkjooV5zfgM6VPht7wd4o5SlJPGsx9EFKFudOHDQ8S7xDPH9x7xPFT8yL
	C0gfq2araEZoie92usB2j1zIL8wqMnxLGy0SCfS9ZvsIoUeJbxM1D7rQxkN5sN5i5MJrGXy3el2
	WQzSoSBg5C14jyyM6gSH+itnlBzFORWanqLf8TThGpjf0JRjZ7SPKtl3rCrgXTqrw9Lu1e2HriB
	SVZB9LJlKQ9k9tfRlqq5mmvL5rBdmUSgOd9JwUkIurUdcuvbxcq9lxuLzxrY2boTqwznIgwP5EV
	NoHSJM1s9HeyLKGLRrFSyhd9IhrF0CZgZgI49JKbU+kzPk5FxC/O+DVOTScU8h3yqtDBzjr88Cq
	hSyet80W82bTIMzma+qUOHIP5eFwKJGRunlnSuLo0sBs2haYlC1DZMhy/W2MShFBTGF0144HEAc
	yo3PMxtmTX88/G69tdpYRUC0rGSo8yz2tllvX6OsdFYNukhNzScINg3zWHzKflMf2j/S/Qfuq6S
	2141dlVHgU=
X-Received: by 2002:a17:90b:524a:b0:3a4:71b7:eb63 with SMTP id 98e67ed59e1d1-3a471b7f585mr3801721a91.10.1790699257948;
        Tue, 29 Sep 2026 09:27:37 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497f23328sm6510887a91.10.2026.09.29.09.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:27:37 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: Re: [RFC PATCH v3 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Wed, 30 Sep 2026 00:27:24 +0800
Message-ID: <20260929162724.1545-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260929141337.6F0321F000FF@smtp.kernel.org>
References: <20260929140649.55-1-yaozhonguwl@gmail.com> <20260929140649.55-4-yaozhonguwl@gmail.com> <20260929141337.6F0321F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2026-09-29 14:13 UTC, sashiko-bot@kernel.org wrote:
> By delegating this core power-off requirement to the optional
> pwm-backlight driver, could the board reboot instead of powering off
> if the backlight driver is inactive?

I plan to keep the GPIO1_D0-only description in v4, and to make the
commit message say what the backlight does and does not guarantee.

On the emergency case: the PMIC's power-off prepare handler runs from
kernel_power_off(), after device_shutdown(). orderly_poweroff() and
the forced hardware-protection path both go through kernel_power_off().
emergency_restart() does skip device_shutdown(), but it restarts and
never runs this handler.

With pwm-backlight bound, it sets GPIO1_B5 low when it powers the
backlight off, and its shutdown callback attempts that from
device_shutdown(); the result of that GPIO write is not checked. On
this board, with the backlight on at full brightness beforehand, the
GPIO1_D0-only setup stayed off in 3 of 3 runs. GPIO1_B5 itself was
not sampled at the PMIC handler in those runs.

With pwm-backlight not bound, it does not claim GPIO1_B5. The pin was
an input reading low on this board, and that setup also stayed off in
3 of 3 runs. That is an observation on one board, not something the
kernel guarantees. In particular, if a bootloader left GPIO1_B5 high
and pwm-backlight failed to probe before setting the pin, it could
remain high. I have not tested that case.

The alternative, listing GPIO1_B5 in power-hold-gpios, means removing
the backlight's enable-gpios, and I have no schematic showing that
property is wrong. That is open question 4 in the cover letter.

Thanks,
Yaozhong
