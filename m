Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844432;
	b=dlLFYt5ZtukQIJ4mVekukUdHbAsTDvCYbzHMAuzR4rFSrmzZRQEd/Vfce9Kuuzbp6g4X
	 lA5TFFJ7o47LOcW/Kn4jxx7XaTXEis9BymW+5QLpf7UGkepGtOla+4VrgoRTq0qbl7/ys
	 /wrvCmQH4o8pGoTWH4WGLinkt6wrOPEYPJf+KvgUnh3In+rw6W9syozlSTihckfLD48Bz
	 kxd41PYqgCwlFM15QzDRFKSblaTt6YGW/ZdqLbnzMV5MJdm0bQrtfbChrMOHHhoCARKt8
	 Ztrwl/2w0Hgh4T4LcuCTuf/pv0uohBrc7D/pF5RvG4oijvXawXOvawYKh+zqUaNoeqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844432;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=LhVqyBGBI3lxfifcbc5k6tX9f39LY4M/qAUI7NNmN+Y=;
	b=joESQT7tOOjePHHRnMisO3MUax9t3T8rESRJ0/0SKRF8GSkBT1Gv5UhJX3eIUHsETruS
	 Yn2gYxO+1RvutCh2TwzxM/3UkvEXn2Fa2AoZMtiC4L7ldhoetgdigumtH5SPUDhtRn8AN
	 QxOzBb5T2UooXfiPnqoBOXu6F8nsPHNkqrYEr2XZpEajf8sxqjaCWKpZfHohPw2OCKz/L
	 2rdZxEjTx9cQCa2Zd/sPPjKQZGuTEEXgriBQegvQH/xGV5mDoxNt9K8w1knaJu0vwMtKA
	 pGaNvEu6QLbnNJnu2aZ4NkMNeP9TnZ92I8iX9vXPvOJeYDIA5J3tz8clbbu62TyyCfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rMRfk8bt;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EC4606A890;
	Mon, 16 Nov 2026 15:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71EC4606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rMRfk8bt
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B982E4E41601;
	Mon, 16 Nov 2026 15:53:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 827E46023F;
	Mon, 16 Nov 2026 15:53:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C4E311BC0D9C;
	Mon, 16 Nov 2026 16:53:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794844428; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=LhVqyBGBI3lxfifcbc5k6tX9f39LY4M/qAUI7NNmN+Y=;
	b=rMRfk8btuLVcUhPl7tEuJgZEz2wURlRw9ayb5gDWGKqKjx/gXe4mGGAMXr+XXlz9m5yim3
	RKOWpSIO6bTptoz6hApVQKhwaxE7Lgrx5W3OwmeltO2LxhOHkgT/SSRWuSOf3ljZ2kBL5K
	h8OCDHRfiXMKUZXisjmIw9CoE0bSZQu/TtDYw7qsOGBnQLwnG11Ouf/onx1jmT7PZueQf3
	lGx2+cq4Siz5ChSzcyqJja+k5Qj4OGnivyXbqpBR973AXRVcUNdZznmK7UVkyTQiN0Uf06
	Z5lDYaZoPwyusCyChwAc6OSX1gR6ApWnGL46elAGdLyMLESGgUTtdBj4Bfp9OQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-bot@kernel.org,  Vignesh Raghavendra <vigneshr@ti.com>,  Tudor
 Ambarus <tudor.ambarus@linaro.org>,  Richard Weinberger <richard@nod.at>,
  Kyungmin Park <kyungmin.park@samsung.com>,  Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Han Xu <han.xu@nxp.com>,  Keguang Zhang
 <keguang.zhang@gmail.com>,  Vladimir Zapolskiy <vz@mleia.com>,  Piotr
 Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Rosen Penev <rosenp@gmail.com>,  Frank Li
 <Frank.Li@nxp.com>,  Wentao Liang <vulab@iscas.ac.cn>,  Rob Herring
 <robh@kernel.org>,  Alok Tiwari <alok.a.tiwari@oracle.com>,  Chen Ni
 <nichen@iscas.ac.cn>,  Runyu Xiao <runyu.xiao@seu.edu.cn>,  Hemanth Selam
 <hemanth.selam@gmail.com>,  Pengpeng Hou <pengpeng@iscas.ac.cn>,  Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,  Triet Hoang
 <triet.hoang.dev@gmail.com>,  open list: HYPERBUS SUPPORT
 <linux-mtd@lists.infradead.org>;,  FREESCALE GPMI NAND DRIVER
 <imx@lists.linux.dev>,  moderated list: ARM/STM32 ARCHITECTURE
 <linux-stm32@st-md-mailman.stormreply.com>,
  sashiko-reviews@lists.linux.dev,  vkoul@kernel.org,  Frank.Li@kernel.org;
Subject: Re: [PATCH 1/1] mtd: use dmaengine_desc_set_callback()
In-Reply-To: <avslAXoa_LSuFNrP@SMW015318> (Frank Li's message of "Mon, 16 Nov
	2026 09:45:05 -0600")
References: <20261102181406.3994422-1-Frank.Li@oss.nxp.com>
	<sashiko-outbox-193928@kernel.org> <87wlqcrg0u.fsf@bootlin.com>
	<avslAXoa_LSuFNrP@SMW015318>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 16:53:32 +0100
Message-ID: <874idgrcw3.fsf@bootlin.com>
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

On 16/11/2026 at 09:45:05 -06, Frank Li <Frank.li@oss.nxp.com> wrote:

> On Mon, Nov 16, 2026 at 03:45:53PM +0100, Miquel Raynal wrote:
>> Hello Frank!
>>
>> On 02/11/2026 at 18:21:00 GMT, sashiko-bot@kernel.org wrote:
>>
>> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> > - [High] mtd: implicit declaration of dmaengine_desc_set_callback()
>> > breaks build
>>
>> Should this land after DMA core changes have been merged? I have too
>> many patches in my inbox atm, so I will drop this one, please re-send it
>> whenever it can be applied and I will happily take it (with the commit
>> log fixed).
>
> Sashiko should be wrong. dmaengine_desc_set_callback() already in
> v7.4-rc1.

Ok, I put it in the queue then.
