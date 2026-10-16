Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D3C3C3F45;
	Fri, 16 Oct 2026 19:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179065; cv=none; b=LodrQ8docA/odzjCqW2MkWWsaQCYNyuHPkO5hXnA1E57QS11lYd8SlAJkMsX3ASNW5E1kicvuEX7YVYtqduYsdJGT4zjMfyel5fWx2eYcOWD3ktTAPi2/zA6y78oc08viMG0QSscXdAiVs2eYaWtyAJeOIV2trwHA1M1/xjHOjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179065; c=relaxed/simple;
	bh=mKpQ0WjsP1hv2RQY0VEycc/EFYk2f97Pn+oyeSJUov0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZDnOsiqjBN26rEb99umzySzisP9BJt1HLmsKJRxXhTNp950rXqndVdu0N79SVCGqvYCDCgo+aGah1AKg/gM7PC0Ls3Zj6ARrTiTnvwQdE6fc9VBHTdVwkcwAZFrEL3EWU6HRRdIYPMriuHSm4TOGXRCPfqTs9Zq33LybZK6HtV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=ikSZ8COW; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="ikSZ8COW"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6E31109826;
	Fri, 16 Oct 2026 21:30:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792179056;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=8nRmOHk9Xleu11rraeUlaPjJM55Fsy/3eZeI+fbspdA=;
	b=ikSZ8COW6ooCz6HiccETzaYYfhIPan9EWYuC4aoolYGwK4+V7e2ASiCtfkxcdDYNyoWGKP
	PTH3LSX/wKWXjg2+wm036oyXbp2VEs4vkTKpHHB90Nb1nDXEY88B9z2u6S3aG02sJPji5y
	HGvV9I/pXoT5/1kVkJJAJYfNesbgDSdpqs+/vva6riCrUh/u7px5K4SD0aJHQeI2yZshbi
	QU6cCLBXQdVC4Z3KBrlhvd87LgMGdXQmogn0u3ulxa6LLMnkFo8jS5CcOE2XOVm5PvF0JJ
	h72Gw2TN9iWQalSEtj+8m5NEOpInYINWBZw4TPm7VqbfpPqE1D3Jt6vL/2f8dA==
Message-ID: <0ebc7d1e-9c1d-43ad-97cb-f7ad5182cb9f@nabladev.com>
Date: Fri, 16 Oct 2026 20:18:35 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,PATCH] enetc: Set eMDIO MDC rate to 2.5 MHz only on
 i.MX95
To: Wei Fang <wei.fang@nxp.com>,
 "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
Cc: "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20261001223947.60189-1-marex@nabladev.com>
 <20261003013406.536AF1F00898@smtp.kernel.org>
 <20232ace-d9a8-4082-b553-8e029ab63963@nabladev.com>
 <AS4PR04MB93380800DF5CFFEE1F5D8ECF88932@AS4PR04MB9338.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <AS4PR04MB93380800DF5CFFEE1F5D8ECF88932@AS4PR04MB9338.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/8/26 5:27 AM, Wei Fang wrote:

Hello Wei,

>>> When enetc_mdio_write_c22() and other MDIO accessors use
>>> ENETC_EMDIO_CFG(mdio_priv->mdc_div), the MDC clock divisor will be set
>>> to 0 instead of a valid value (like 66). This results in a clock rate
>>> that violates the IEEE 802.3 2.5 MHz limit, breaking PHY probing and
>>> leaving network interfaces unusable.
>> +CC Wei -- this is nonsense, right ? Ocelot isn't even NXP ?
> 
> No, Ocelot switch is integrated in LS1028A, as a PCIe function of NETC IP.
Oh, I didn't know. Let me fill the default into Ocelot and 
enetc_pf_common.c .
