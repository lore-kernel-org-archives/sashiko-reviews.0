Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627109;
	b=qHFp7CO5l5VVrEkhSNQcO4R5UVhYSgQZlBl27fUutNfYYlxSlWV6TI/n2S9SgL0k26z4
	 FkmD0DdL1cJYmmuReK0mGwsIXATmOqqw/rfopwIthgwz+R2J80JuY/yYvjekFrbROxROS
	 Dw6Levhub9SUurfSKrRGTfWmeQMsTMVQcVW68lbua5SPm3fs4fdniPranOrYntQXa9qCN
	 rlKIsHXpkhLeUSjgsQ7nl3POu6hyUUKTBzv/IEUMtJz063ZR74595c5e3uZOR3Jr5C9/S
	 FcHkqmUw+oWSvlmFxbz3FNjKcw5AYffm9bWx8TcQLVM3JNUrFNawv5yXAY6GjcIIrHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627109;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=+ns7gOv8s1s9c9eZ8c9VUcseN0nnkqSVnaswDM7v3Vc=;
	b=lVlslwEAMc7ueTUargbFID+XdOwU4sJ2wPHkwNl9GZWsCqfhkMpt160ylfpgjp7cRXvC
	 Zefi8oHYtvkmnwmflGYzsT3zlPGCVwAsUy/W95kTS2oSNaBPQjX/egbGdOPsjZpthTnlN
	 EbjF4vOM4dRE6phqBLrOd7WkfSXtw1XnrP7xWLAkctLYNkBMM3Np5T0eczBhDk4qNMhjD
	 Cj4EHSKbz1s6pfXPtp9KL6UpLGa0pvEomuf/mVn8LY90qu9sXHo1k/J2a6JJmKZOJ1YF4
	 RgjVQo/uHh+M49GljlsCjAYU6kC8hUh2zMMT22NpigsPYXjU+wo1xhkWkFCh1D073Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=LLqo6zWn;
	arc=none smtp.remote-ip=212.27.42.6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EFD606A32D;
	Mon,  2 Nov 2026 13:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16EFD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=LLqo6zWn
Received: from L20747.iliad.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8258F780389;
	Mon,  2 Nov 2026 14:45:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1793627106;
	bh=1PQFEgtStTpOAuEf4gYmhM2SJDREscuGArCdbHnAAfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LLqo6zWn95bB6Er28VcM9IQpjeIjlbO7afzINEKDp4zAjnh+wS1dMauSy3iDvlXGN
	 RJvePjhIASdVTMf4A7rXdRVDVIDCdadkn/X1jMNanSpgm61hL22MkIKS7VlE1tWqmy
	 /msrCdRpg8Ov5SrMiOQFRu13lEMDJeRQmOwvOAJNXwiuFocrBxYcMyGc54DTnG2DvF
	 krWslHIC6+7TeGMxyrJvUyN4VlRXlOo6yjCXqwluMtfuQRqfVpd4lrwSg+S9FYZDek
	 3kL8stmn7IiDDOMcFbEadKnfDUe6SRzJ6rxkP7bq01tFT0eANzy9V9YjrssdStqdh6
	 /SAXs24M9nFtw==
Date: Mon, 2 Nov 2026 14:44:59 +0100
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
	conor+dt@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: lx2160a-nbxv3: fix 1588 and id
 line names
Message-ID: <auiT26lG5A8511gD@L20747.iliad.local>
References: <20261101-for-upstream-nbxv3-dts-line-names-v1-1-7c8eecb2da9f@free.fr>
 <sashiko-outbox-192493@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-192493@kernel.org>

Hi M. Bot,

> First, the commit message states "Let's properly support 1588 on this board
> and fix the names", whereas the patch only updates informational
> gpio-line-names strings in gpio3 from ptp-refclk-in and u1700-zl30733-pps-out
> to altfn:tsec1588-clk-out and altfn:tsec1588-trig-in1 without configuring
> clocks, pinmux, or 1588 hardware nodes.

the 1588 is already into the lx2160's dtsi (see boot/dts/freescale/ ptp-timer@8b95000,
for its fsl,dpaa2-ptp). The CPU pads are muxes at processor reset by its RCW,
so this patch only fixes names. I'll improve v2 accordingly.

> Second, the changelog does not explain why those gpio3 entries are relabeled
> with the altfn: prefix (for instance, whether the RCW muxes those pads to
> TSEC 1588 alternate functions rather than GPIOs), or why the TCA9539
> expander at gpio@74 is changed from 16 board ID straps (boardid-0x0001
> through boardid-0x8000) to an 8-bit board ID (boardid-0x01 through
> boardid-0x80) plus test-mode-tp1500 and grounded pins gnd-p11 through
> gnd-p17.

Few topics:

For timing,
On this board, the CPU's RCW sets EC2_PMUX = 0b10,
so GPIO4[14] and GPIO4[23] are resp. TSEC_1588_CLK_OUT and TSEC_1588_TRIG_IN1
but not GPIOs.
altfn: is the prefix the dtsi already uses for such cases.
The new proposed names avoid the confusions between the DPLL's pins the CPU
is connected with vs the real local CPU/lx2160's pad the CPU is assigned by
its mux.

For board ID, the schematic is based on 8 bits with P00..P07, for the initial
commit I did over interpret. P10 is not a board ID

> Finally, was removing the comment above pltrst-hog in gpio1 intentional, as
> it appears unrelated to 1588 or board ID line names?

No, it is not related.

best regards,
  Vincent

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261101-for-upstream-nbxv3-dts-line-names-v1-1-7c8eecb2da9f@free.fr?part=1
> 
