Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837544;
	b=Wyukl+M2n1vUJldHXaqvrdud73LDcH2HnmkhOLnP5vQ2ni3Knq116ZkLugHMgi0zapYa
	 Be8NjUmE/xPbbJBaGedmsvIG82N0vmJVVAyc3FmP30KWj0bSfU0MQIrhaCSnKN44m2Ki7
	 ssqUAKIJSe2D3bNxT9/fRfDXK0flDW4Trol8vk6aX8RYEhelDNNljPNmLUmnsILrjzvph
	 Sacjtj9RL/IbWcg/m1l3bVa3iUN/rOF8GioXFCPpMEKyXCmjRC5CfbOoCZNGP0BUAVp72
	 N3PmhWSxvRekw9r7LBaq1yQEgqSwkt7lW43fi0wSazeZ6SUWfYOyNF6pEghP0tUxZag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837544;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=iaqvgRtBYr1vwCiy/P8BDoJRixcx8rIq3CnR06buB/4=;
	b=tMPFNqn5KuCZm/l4o5mPfN09FKdjAuxoGruEr/JxRuGM3jMqOlj2wmYiEELH3HGccSFA
	 p9RlL+HF6s9w4DOCtjLQhszKShhg3qCAWILeugpj8womfOx+SuStcYds4mxAsFZMgAsf+
	 1LvvrKwnnPtLNBBfH5sPa6I8RlS+xClcWdYym3HO83194G88Z5riHDQqRM21SSleelZ9z
	 KS/Z/LxD/JztEMj0Iv9X96YSq5gCfTJzbx7kUL743fXJALZzqgwcQ1GmrBdTJaeHtGM82
	 dvHG7HkV6YRSrlF24PMC6Yc/jRezg6qDfNir4qokZsaeN22iv0zOBg9JZA9FjB9qASw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uHMtrG8C;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510C6606A887
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 13:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 510C6606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uHMtrG8C
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A47404E41600;
	Mon, 16 Nov 2026 13:59:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7878F6023F;
	Mon, 16 Nov 2026 13:59:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7C3B11BC0298;
	Mon, 16 Nov 2026 14:58:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794837541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=iaqvgRtBYr1vwCiy/P8BDoJRixcx8rIq3CnR06buB/4=;
	b=uHMtrG8CfsDS6DrHfFBHZ0/AUBFDKdhoZ17yOGEElcPnGryIpeAnZ/27pbpEg8mL/eGxrs
	LoBdoI0Kl78K8/6XBS+HrZkCblz7bQDIu0o5L/WUqZMSJGjUz37OSbP2joRgXFFGqidjKM
	LtxHUVC7c/CFznxUOAmSP++b1pu6zc352tbuom1AVDbYSFduBRJ5kLcfLc5ZgHT7M/ZpjT
	hXNoYrzKr6zddLTvEK1klTrn4EW0u0/2joplpvGxBnUCdlgrD/1FhKejEtTWLKWeFzjq8h
	4TyHjwOglblNKGFpjjluxXrkR0XLfIvtNGXJghzmdaH+q5NB357Sh34m+O+9pQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Samarth Narang" <samarth.colleges@gmail.com>
Cc: sashiko-bot@kernel.org, "Han Xu" <han.xu@nxp.com>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  sashiko-reviews@lists.linux.dev,
  "Richard Weinberger" <richard@nod.at>,  imx@lists.linux.dev,
  linux-mtd@lists.infradead.org,  Frank.Li@kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: gpmi: terminate the DMA chain on
 completion timeout
In-Reply-To: <87pkw4sx1v.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 16
	Nov 2026 14:52:44 +0100")
References: <20261030150929.2944717-1-samarth.colleges@gmail.com>
	<sashiko-outbox-191156@kernel.org> <87pkw4sx1v.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 14:58:59 +0100
Message-ID: <87jymcswrg.fsf@bootlin.com>
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

On 16/11/2026 at 14:52:44 +01, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> On 30/10/2026 at 15:20:32 GMT, sashiko-bot@kernel.org wrote:
>
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] mtd: rawnand: gpmi: unsynchronized DMA termination in
>> gpmi_nfc_exec_op()
>
> Sashiko complaint looks legitimate, since you haven't actually run into
> that problem, I believe the fix is incorrect on this platform and
> therefore a DMA patch must be sent first. I will drop this patch, please
> resend once the DMA part fixed.

Please answer to your previous patches, stating why I should not
consider them for review when you send another series including them.

I will in the end consider this patch -in other series- for appliance,
because the fix seems correct on the NAND side, but is still probably
not working as expected on the DMA side.

