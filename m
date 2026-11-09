Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794263171;
	b=X7aGLcLMd1IP4VpgiaZVmkge9XRjl3fpeCu1FL3hj3YQMNXvi80rFnW5/j4gsqc8ojU3
	 Q9wjGjrSm6tog1/SuO8/DjUie+AhEJ9Wl+14MAD/2Ph0+f2jPx3t5juo4U8RrheXsAb2/
	 iaQqO34eVoLJm/zeShoX3dsUWtr3ZQWb00GbsflHKGu7fD9sy463ovJTNl0XQ2FCH3YOV
	 g7JiqK66xyb/z6cUX/5CCOcxJKDax8rk7BgJR8wjHkYgeEaRaO/jq9WSgyYXKkOcqe5qn
	 5XwlN5u1qOG25f0i3TCEGEXXG9kdoDQIkAg6RqKb6pcGULJ4LegDHDUejvVOKDoZc8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263171;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=nUMxjb6gs6vYB7cR3j7txlsOovmAEjE28wFZ5v7MHaI=;
	b=A+ZMgKfaDwKn9IArLP1XwjDM5Dr4bpf/lq9D42wndu4AwVOEzmPpNZaBqqjk0Cxu+Cku
	 6hMJolq2Ci0oqMn4ZM55/hDnQt7Ult10hNsYF0noJ82lUVRGgRDIDhksoC1tn00p6uZ1g
	 PDHaKCILoau+fCwZrFaC0WvedocCplApea4q5phNOxPox0n4oRmnpRIYgmRPb77zfd7sU
	 /SjA1khxlxkew2rvLEEloa/uCOaYfDxaQj/Rna7ON7IhoBELsyhlhpUXmZ8URsw/1c8/h
	 U/+b37dcUvWoHvo9QPzzH+t3UZ9b3Yq9NaMONLYzODvhDVz3kcFALqkoUO6ffvYNE1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	arc=none smtp.remote-ip=91.218.175.222
Received: from mta0.migadu.com (out-222.mta0.migadu.com [91.218.175.222])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A454606A321
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 22:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A454606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=jkGqjOWkX2WRLFEVM7Rf42dfHjKU16U8tGacNF/uNGM=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794263167; v=1; x=1794867967;
 b=ly2u3jdkrOoLDaBMAKTRTcASIBg+RD0hwMljRycFbDcPTD17+txoMTk3LqWPmw1OGRKYxnFc
 lg1bsDQd044emfZfgNkxF6TFeRSqnYkZGjo0BtrLDGstO1dnKvdnVint27XYT9AvXvFnsplBXz0
 FDmdBhF4/WCZAuVO+LMuUGEIj3WQpyHL7BwLGJKx2covC7ZxuzFaXZd76fC/bXYSbaYXPekJI/L
 K4msMQiM2E/n+Ao4ryr5cHiiap6r1ZShnIycyeer6eFJeQu9m//S2slaOSIEp1goTe5RxJPRY2T
 FNgJXZaP3Kfe5dLiwf1p1a4QGeOqUE/e/sk7sTidykjaQ==
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 737c012b03023269;
	Mon, 09 Nov 2026 22:26:07 +0000
X-Mizu-Trace-ID: 737c012b03023269
X-Migadu-Flow: FLOW_OUT
Message-ID: <f98879ae-816d-423e-9de2-5dd5cef4da46@packett.cool>
Date: Mon, 9 Nov 2026 19:26:04 -0300
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: pmi632: Add LCDB regulator node
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261109221453.658316-1-val@packett.cool>
 <20261109221453.658316-4-val@packett.cool> <sashiko-outbox-205717@kernel.org>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <sashiko-outbox-205717@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/9/26 7:22 PM, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] arm64: dts: qcom: pmi632: undocumented regulator@ec00 breaks
>    dtbs_check
> [..]
> [Severity: Medium]
> Are the Devicetree binding schema and driver for qcom,pmi632-lcdb and
> qcom,pm8150l-lcdb missing from the tree?
>
> Neither compatible string is documented under
> Documentation/devicetree/bindings/ or matched by an in-tree regulator
> driver, and Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml has
> additionalProperties: false without a pattern permitting regulator@[0-9a-f]+
> child nodes.  Adding regulator@ec00 causes dtbs_check schema validation
> failures on every board DTB that includes pmi632.dtsi, and boards enabling
> pmi632_lcdb will fail to resolve the pmi632_lcdb_ldo and pmi632_lcdb_ncp
> supplies at runtime.

Is the bot using an outdated tree? xD

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=487f55870c60150e44182a8dbc95232c240bf7a8

That sure looks to me like "qcom,pmi632-lcdb", "qcom,pm8150l-lcdb"! and 
dtbs_check did not complain locally.

~val

