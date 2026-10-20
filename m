Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=218.76.62.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460652;
	b=zhh7l5xr/BiIolVih1FpUPABXnihvBg9jwaHVvSs7KaJUa3IdizrbeiLBg0MXSKVl6A0
	 KHwKP2MxAOjWpIsHCULw5KIm+jvKCJ0KxOHt2/m5Yoqmn/VQT5e6FS2dWJwaTKpPiWfuo
	 B02t2fH0gZauX7+A0YjTF9o9W4IWZh61qVYdzBmmtdBxOLpHkv01ba2Sq7DLEdeIlykuC
	 hxxUIDqb58pAXmpIndciimjCV1UmNDpNP6SKAEdAmqvVScH7HUj/TTMXBOI9Z59rBAN6u
	 Q8awjky4rzYNnE1F2gz0jpRFtzFEM3DqdRUWk/3a9x6zdoZSNUKKcBCMPU3+8vBAfFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460652;
	h=DMARC-Filter:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=xgIIXHNklelq3OKVdtM53HYpQFcgP6CuMT6ZV0HhFpE=;
	b=s6A+P2hWe7E7Iy4ZAVp0xCVdGDhPKnAiTZUgGKxbiq+0JcKzi6Q2SYk6hT5TA5fu6onU
	 UOzwIAfm4VjRJSBoc7lPGcRFr98Zmwnxk395LW1UFx+LN5ACNkoncRINUTCbfLcgBB3kS
	 Bd8EMSpE60Zqy4UXMblRCtD4F5wvALJrSHebfLO+SdvH4PkYqAOvBX8B0ic6UgloFy+UJ
	 IUHBG1I6YxLnF0UiGzd+CN6wf5N1jf1l/7LG/PnEj4dwJgCfR/batFx+z736QmZkIEWzp
	 d70rlEHRNnz6GVl/pQouv4UxNPRbtlO0xR4vJu+kwqC3kxraLCHbawjb7f9GmkOegRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ultrarisc.com;
	spf=pass smtp.mailfrom=ultrarisc.com;
	dkim=pass header.d=ultrarisc.com header.i=@ultrarisc.com header.a=rsa-sha256 header.s=dkim header.b=LM9XveUK;
	arc=none smtp.remote-ip=218.76.62.146
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97207606A31A
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 01:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97207606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ultrarisc.com header.i=@ultrarisc.com header.a=rsa-sha256 header.s=dkim header.b=LM9XveUK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=xgIIXHNklelq3OKVdtM53HYpQFcgP6CuM
	T6ZV0HhFpE=; b=LM9XveUKKDI/xSvh11XN908U3TT1z+S4zPhlww1iu70ZrDblG
	/8PJhAGJyMu1OTnMoyP9neLL9omNHCtJqGqpsGNs+v4dy3iqybHCOVdroNopVUSB
	aDfK9CXbBpdp2s1qTzBT9XoJ1iEO/VZlcQRjxz1xsw7TT0BMM5mBPICkLk=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwCnYwVfx9ZqPnoCAA--.763S2;
	Tue, 20 Oct 2026 09:43:59 +0800 (CST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 7/7] riscv: dts: ultrarisc: Add Milk-V Titan board
 device tree
From: Xincheng Ji <jixincheng@ultrarisc.com>
To: sashiko-reviews@lists.linux.dev
Cc: Xincheng Ji <jixincheng@ultrarisc.com>, devicetree@vger.kernel.org, 
 robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <sashiko-outbox-176776@kernel.org>
References: <20261019-ultrarisc-dts-v4-0-3979747cda2e@ultrarisc.com>
 <20261019-ultrarisc-dts-v4-7-3979747cda2e@ultrarisc.com>
 <sashiko-outbox-176776@kernel.org>
Date: Tue, 20 Oct 2026 09:43:59 +0800
Message-Id: <179246063943.3442927.10941907832509473109.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792460639; l=1550;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=0TzYJGZy5I86oYAb9Hp6QkfTOgUAxfb3cKoAWqceUnU=;
 b=GDC4Gt1T8ifldM37DVWQcgCGqo9gbdMsCVGCAnTLFHBDmHvgt0M7MJliegRhprHn4W7Qi88Ik
 mIxVacg6jB8A+fWxZmSvsFG4uPdbANncL0u0JBIT8w+7b9Bh7bQEOw9
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-CM-TRANSID:AQAAfwCnYwVfx9ZqPnoCAA--.763S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF1rtFWrJry5Cw15ZF1rXrb_yoW8Xrykpa
	15CF4j9rnYqr109392qr18C3yIkw48Jr47JFyayasrZ3ZxJr1Iqw4xC3WYqFyUGwn5ZFZ8
	Ar4rXas5W3WDCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvI14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
	9x0JUBmhwUUUUU=
X-CM-SenderInfo: pml0x0xfkh0wg6xo325dul2uoofrz/1tbiAQAFDmrVviwAAQAQs2

Hi,

On 2026-10-19 08:08 +0000, sashiko-bot@kernel.org wrote:
> Should the label properties be dropped from led@1 and led@2 here?
> 
> When the PHY driver probes phy0, the call chain:
> 
>   of_phy_leds() ->
>     of_phy_led() ->
>       devm_led_classdev_register_ext() ->
>         led_classdev_register_ext() ->
>           led_compose_name() ->
>             led_parse_fwnode_props()
> 
> checks for the deprecated label property first in
> drivers/leds/led-core.c:led_parse_fwnode_props():
> 
> 	if (fwnode_property_present(fwnode, "label")) {
> 		ret = fwnode_property_read_string(fwnode, "label", &props->label);
> 		if (ret)
> 			dev_err(dev, "Error parsing 'label' property (%d)\n", ret);
> 		return;
> 	}
> 
> Because led_parse_fwnode_props() returns early when label is present, the
> color and function properties on led@1 and led@2 are never parsed and are
> completely ignored at runtime.
> 
> In addition, Documentation/devicetree/bindings/leds/common.yaml deprecates
> label for new bindings in favor of color and function.
> 
> Would it make sense to remove label from both nodes so that the LED core
> uses color and function to compose the standard LED names?
> 
Thank you for the review. I understand that label is deprecated in favor
of color and function.Since the LED core still supports parsing label, 
would you consider removing these properties necessary for this patch,
or more of a naming convention cleanup?

Best regards,
Xincheng

-- 
Xincheng Ji <jixincheng@ultrarisc.com>

