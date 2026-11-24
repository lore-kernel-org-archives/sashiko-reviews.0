Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795497884;
	b=NJ3PPeZ2oZwA3Wj2WoeR3cBhZiGFJcatVRzFZ2JVhPC3P/BgDC+Sacg/t8XVf1wvQs7w
	 pXUXMgXEREjReBV51PbKdlpOn7B2xSyIsaKdlZ+3MeRkxZ4k7U5r1R3wpOgy2rhWOQcLD
	 K5rTJiAA6iQdiEoQd+/two2Y7aWLkgK4ssIkAL8uIjdQ7pJD2jF2astahZm1U21h9p2/5
	 pXTFZdkPxeGoCNfVRMKIp8ZkBcST6f95v0u9I24FI5vbUAodaDr7vRG9FKSkFgqhyq4Zx
	 4XjV+dgI4vAGuxVu26cF7aBj8o3zlZzMrjDQ/uQEUgpX1nelHdu5z3GqU+ofRFMxUZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795497884;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QzR4znUpHkFQ2LRl3l50Okic0JbJkrnumL2Tbt7Auzc=;
	b=4YJ/a4PSiKMRWS0Y3p+dcN3IuevqP2LO49nCmiKvI505/cyGeQbwvebB3PDckwkB8RP1
	 M4s8Ajd9mfVxGissabvdiRrbzKqdrAD5wV/tl7+Xf6iRv4Ul2tV9as2R7WHXWXDaX+khn
	 UER5PK0RceYx7col4eOpEFTrNhBjeMAcPyaiokEwTzUrzFq2Mol/UO92QVzQSkf0OmTiv
	 X3Gz7KXUsl/DKk8zLsriNKSrX+L/jvvhIGaku9EDfeTxZsEGP9sB2n2YGFRg+Bdl3f1lA
	 YoDKZ2INtdUEG3Z3uJg7i0C9OZubzA58lDBWH9sUvD7xfLMszU0qA7muxEvpRxPj67g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654FE606A322
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 05:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 654FE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67da69e7c31so4271215d50.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 21:24:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795497883; x=1796102683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QzR4znUpHkFQ2LRl3l50Okic0JbJkrnumL2Tbt7Auzc=;
        b=jJ85mHOECQ0qWfJ//04d2lBi6zkRvhMg4IEoxGkRWNEU0BtpNJpIlRgCJkuQsNdDKW
         rY248XYdudMzlaQC+aPfNKtPXFpU3uyH/4A8QLJGhK3vBVuxJDFTvDvbgZOkfa5EouFP
         YN0QYf1rSIX/cHML7CxzMSMfsY425QCgjRsJmg1eDbmBVeOS7PEIht2lgH9+25nRBOxH
         PMb1oiKprqyXzNxBnLYkdqij4u7g70DTw8np+ofz/oR8/t8JbJ0+IibfHd6YwHbhE7wX
         KWkWrbWvrJtOyjNeRXiUV3V31sI/VvB7tHo/rW+u6AW+Xu5GebCBST+4lZq1h5q5bEy5
         ogTA==
X-Gm-Message-State: APuU4Z+V4SZSpBVyWb/zCK9xCcxtkxmcQZUIDrQLgn9j8zYMF/tT1+yo
	hYhzoOXscjO6CtX92miYbHF2cGkJYX6Ukz253uKVoVdwf8dH6rroSrPnKSJm6Jkmsc0=
X-Gm-Gg: AZFdTZfoSkndxoAtu7BGdTAKmjX7255dP9ZNzsS49F5s8Ms7wEoXcrFySyL3dZTRBoF
	iO4litBkpkdBrG5VXKvwdH3AKMz+tsH3R7l4WTs79ifMpAffpa+i2HYkNLphI21O43L11uFfJ0d
	bKcyzTFut8Yjtw49I2MKyXCfvuca1t5aODW3kPGmHYm0ie2WrcfpC8ftVtojt1i7H9Ro/Yd9L8u
	5vHqHxCTuTGk28JfuOaIISoOGU+dSCv5ExA7Z6TtXdl5/UKurtw+5GR5aJZgy1i58Bi+zJI8cxf
	9rKJvTSMZB2Yz8Uj3hTeD8iSiukW+5Zra4/4astftwINtdLrSSl3t1oNm6CHWaePuG3pHnlKvRk
	xmHHfuLHx0PPYah3Ryq3/0B+ii2QwAgkvxVZ+SKg/QkOxkNPvxuFhyB31IfjRHOuyczsuZ1SnZd
	/OKw1VIk+/g2bbsK1bdbqxP9ua+tKe55xeiTCKThScI7gMVAuiATsXNFR5jJO6ajqMMPBwWJysN
	oLCx4zD2e6/vnVG5YSolSiEzuwFT6qN00MxZiqD4VNP0yYlgF+gYSfddPCvK6Y1iTn2iVC0RJ2j
	e+q3ZgW3gN4SlXLrHGk0/XOKKohdYhhRphma1F5JUphszRQw2cZYcNE4PxFhnP0ohXe4JYr4efW
	3VUX09PpDjcWnkRFYYKEcTuP7ydG9S0tN1+EySvB0i+9oy7kUtloA
X-Received: by 2002:a05:690e:4893:10b0:677:d1d9:127d with SMTP id 956f58d0204a3-67df45025ffmr3481264d50.100.1795497883474;
        Mon, 23 Nov 2026 21:24:43 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df335b3aesm6545977d50.12.2026.11.23.21.24.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 21:24:42 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: sashiko-reviews@lists.linux.dev
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/6] clk: siflower: Add SF19A2890 clock manager driver
Date: Tue, 24 Nov 2026 00:24:41 -0500
Message-ID: <20261124052441.50277-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <sashiko-outbox-230534@kernel.org>
References: <20261123-sf19a2890-sysm-v5-0-4ba44a0db17d@telaak.dev> <20261123-sf19a2890-sysm-v5-3-4ba44a0db17d@telaak.dev> <sashiko-outbox-230534@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> devm_clk_hw_register() runs clk_core_reparent_orphans_nolock() before
> returning.  Because data->hws[i] is still ERR_PTR(-EPROBE_DEFER) during
> that call, any already-registered orphan clock parented by the last clock
> (CLK_MUXDIV_NPU_PE) cannot resolve its parent via the OF provider and
> remains orphaned.

No clock in this driver has a late clock as its parent: the muxes take
the PLLs by clk_hw and the oscillators through "clocks". An orphan in
another driver that looks a late clock up through the provider is
picked up by the next clock registration, as with any driver that
registers its clocks before adding its provider. Nothing on the SoC
runs from the NPU clock. On the GL-SFT1200, clk_orphan_summary and
devices_deferred are empty with v5.

> In addition, of_clk_add_hw_provider() in sf19a2890_clk_early_init() calls
> of_clk_set_defaults(node, true) while the 17 late clocks are still
> ERR_PTR(-EPROBE_DEFER).  If the clock controller DT node specifies
> assigned-clocks for any late clock, of_clk_add_hw_provider() fails with
> -EPROBE_DEFER and tears down all early clocks including the CPU clock;

Right: assigned-clocks in the controller's own node can only name the
four early clocks, as with clk-eyeq, which publishes its late clocks the
same way. No device tree sets them there; a consumer's assigned-clocks
are in its own node and applied when it probes.
