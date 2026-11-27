Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771465;
	b=IlIAJ7xqEYOoPxLpPx3s+2NLQqnMdBU47ZLHb/u285kyqoVCYlvVqYu+AzLIwK1IPxGH
	 aKC1Wj9z04NBKmCRJlnoBsXkDfvkEwYLq3AtWJfzI+YuU2DrU4HWLvLhedSk7+PCqalZC
	 OxT/QcBRfFZGSXHpSHaFwP9nG78y/i1yTXu1A04iPNpZVlnbJkGqW9oRN9vTnIpouqfVx
	 OVBds/ozjuaopJ2jaTLI6uImkt0k1Vek7w0tYvDIKBO4tOLeM/fNuBZhh7nYHUxMFJkqZ
	 nfXcCCAOwT/OS2fM1t3G2ifPLc9WNLQH7x4981hVOTjqicEZp41KcI9OIhdmTp4UdEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771465;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=jgyHrYPYaDcdHaZArH0qgJYcR9o9hCgTJicEvymP6v8=;
	b=Fv0xilGlbIrZo5fQrVIdRSrLlW4az9OUzndTra2h7myvR9LpjLvhU6SVvKc6wmXCvjyS
	 hvHiYKaYezbvsCybpMg0WrHkcAbMk3K3Di98uFI09ZhjxUPf/JWsV8QUVloaOaD1zesEa
	 ue2njLepzI284ypOl3DNwMWhDxFbY9yh7b5GbDzB8bQRfiuajTyF+tAq4Oy98bzS9eaBe
	 gxQWvb9lhhRG26oZ09ywP18TJMkF70t4Ke1yFTSMH6Xuo6EMpIaqdSbwsB/YsLCK6F8Jy
	 aC7wAgPPFtCxRC2CxC7Ajtm2NvDbGwdCMcxgNx/oSHnxnLMPzRAbPFR9WrvNXslZQfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ChK2eBW3;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA0E606A33B
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 09:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CA0E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ChK2eBW3
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BCC8B1A1827;
	Fri, 27 Nov 2026 09:24:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FE9B6049C;
	Fri, 27 Nov 2026 09:24:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91E7911E68208;
	Fri, 27 Nov 2026 10:24:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795771461; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=jgyHrYPYaDcdHaZArH0qgJYcR9o9hCgTJicEvymP6v8=;
	b=ChK2eBW3QA2qWNgV4nzPcBWiNDgSUQbUP3CFkm5tJ3dgq3pwKNZ7d2io3wmtshAvuLTDnJ
	rFCuTJItE3Q0cWqM9tZf30r3HG1BYdatVjX3FDF6Ze+q1N17Op46peLjuXWC7g6FdMP/NK
	cJtdSEZCegXdsb1JCxfCnY8iqgTflNi9lMAXSG+2pOz2BPMGcABM6CaM3u79CeLmTLuEB7
	gYaie9l2X6JTKG7StX171IBZOqc993Pxx7aGob00lAKAZO0gGDbvbc8fZZNhB70ztq97z3
	GG0auLCldd4x6TcwpRLqJsskrFO94QU0HdCnir6Ab7CQb4K86a9agvMNsEM8lg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bough Chen <haibo.chen@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev,  Mark Brown <broonie@kernel.org>,
  Liang Yang <liang.yang@amlogic.com>,  Feng Chen <feng.chen@amlogic.com>,
  Xianwei Zhao <xianwei.zhao@amlogic.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Valentina Fernandez
 <valentina.fernandezalanis@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Haibo Chen <haibo.chen@nxp.com>,  Jyan
 Chou <jyanchou@realtek.com>,  Yu-Chun Lin <eleanor.lin@realtek.com>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Alvin Zhou <alvinzhou@mxic.com.tw>,
  Cheng Ming Lin <chengminglin@mxic.com.tw>,
  linux-amlogic@lists.infradead.org,  imx@lists.linux.dev,
  linux-stm32@st-md-mailman.stormreply.com,  linux-mtd@lists.infradead.org,
  Frank.Li@kernel.org,  neil.armstrong@linaro.org
Subject: Re: [PATCH RFC 08/16] spi: fsl-qspi: Consume dummy cycles directly
In-Reply-To: <20261127085632.44irp2necxfqbbn2@shlinux89> (Bough Chen's message
	of "Fri, 27 Nov 2026 16:56:32 +0800")
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
	<20261125-macronix-upstreaming-spi-mem-cycles-v1-8-fd036402fd37@bootlin.com>
	<sashiko-outbox-233875@kernel.org>
	<20261127085632.44irp2necxfqbbn2@shlinux89>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 27 Nov 2026 10:24:11 +0100
Message-ID: <87zeuutyo4.fsf@bootlin.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3


>> [Severity: High]
>> Does fsl_qspi_mem_caps also need .dummy_cycles = true?
>> 
>> fsl_qspi_mem_caps only sets .per_op_freq = true.  Without .dummy_cycles =
>> true, spi_mem_convert_dummy() converts any dummy cycles to op->dummy.nbytes
>> and sets op->dummy.ncycles = 0 before invoking the driver callbacks.  As a
>> result, op->dummy.ncycles is always 0 in fsl_qspi_supports_op() and
>> fsl_qspi_prepare_lut(), so dummy validation is skipped and LUT_DUMMY is
>> never programmed into the hardware LUT for operations requiring dummy
>> cycles.
>
> Correct, need .dummy_cycles = true

Yes, I forgot to add the capability there.
