Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DCB37D133
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 07:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964413; cv=none; b=BTjJadGBaOgFUgGvdrcSClfYrV1xCkHjyd2kUywUY7d1tZYDegkl/Tn15z1Qn33nFdFlC/EXFmueOrs1iiW4oS6q05J1qFzaCmoyw58wwlrxv3jy0s16vLgz4bd1EyRD6kMmeeGfqcvN5gOuJ8ZiPbva5yvKdpVMWr+676O+K+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964413; c=relaxed/simple;
	bh=gWnFIumBNB38GLNiC2esLxbYtH3AlO3I5H/ucrrclsw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=kvEtXGZ3+skQYnOs3xVLBL801IYBlIL6xNmDMQxo7U9SC7c2AbmcNJwkKHedqolRkpXIWXQf8Bs+yn7MbRIknfC8j4VgTZ8a8d2iWzXxwi6lIXPSjQAdUP4uUIDwVH4JWi3Abh9XLehBIfuGp0IX7sTvewY6r8J66Xy4yRlQTbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=Eq/m0WJ/; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="Eq/m0WJ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=NePItArx6fu3hQGx/oeADV7VFrP4JQGPe
	LFVzL2Fp8k=; b=Eq/m0WJ/DcUrb4ZAAphIT+keAYzhm57YtiYYGkmQJCtS3LkYs
	WApGaMoR0C75SthM84qGPVBrVseYaJ43CRO3tlG6Ei9RUEpd0B6ChpgcgcxU25ar
	1ko0AmC6ZHdxb/omhV2l1Pb4VlWwiUTl157O7flFGp8RyXohEqGl2FuKNM=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwCnYwXhNM9qAgUCAA--.681S2;
	Wed, 14 Oct 2026 15:53:05 +0800 (CST)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 7/7] riscv: dts: ultrarisc: Add Milk-V Titan board
 device tree
From: Xincheng Ji <jixincheng@ultrarisc.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Conor Dooley <conor@kernel.org>, sashiko-reviews@lists.linux.dev, 
 Xincheng Ji <jixincheng@ultrarisc.com>, devicetree@vger.kernel.org, 
 robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <d184f986-7bdd-465b-9ec6-31fe1975aec1@lunn.ch>
References: <20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com>
 <20261013-ultrarisc-dts-v3-7-5ff3ebb2a90d@ultrarisc.com>
 <sashiko-outbox-169511@kernel.org>
 <20261013-siesta-starship-f078a51d2389@spud>
 <d184f986-7bdd-465b-9ec6-31fe1975aec1@lunn.ch>
Date: Wed, 14 Oct 2026 15:53:04 +0800
Message-Id: <179196438407.4116447.10264692072060845573.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791964384; l=954;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=gWnFIumBNB38GLNiC2esLxbYtH3AlO3I5H/ucrrclsw=;
 b=EB9r5MSkJmjQhSGVrtz0iXbxpdoT1+OYxZXZyETcDdwj2SQNenddd7FKmfV5+ws1Be0SVXxyQ
 P6u2V3IbXZ8A+qXaDzsOCBAV8f0VdR+11goHUNnHiy+maL0AA/CLC2N
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-CM-TRANSID:AQAAfwCnYwXhNM9qAgUCAA--.681S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF15ArWktFWktw1fGr13CFg_yoWfGFc_ur
	WI9rsrCw1kJrn7Xan3Kr15Jan2kwn7Xr18KF4Yqr4jq3s8JF95JFyjqr1FvF48JrsxArnx
	Xr90vFW3GFs0vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
	9x0JUBVbkUUUUU=
X-CM-SenderInfo: pml0x0xfkh0wg6xo325dul2uoofrz/1tbiAQAJDmq-VKkAAgAhsN

  Hi Andrew,

  On 2026-10-13 20:08 +0200, Andrew Lunn wrote: 
> > > > +&ethernet {
> > > > +	phy-handle = <&phy0>;
> > > > +	/*
> > > > +	 * The PCB does not add RGMII TX or RX clock delays. The DP1000
> > > > +	 * integration adds fixed delays in both directions.
> > > > +	 */
> > > > +	phy-mode = "rgmii-id";
> 
> If the PCB does not add delays, rgmii-id is correct. What is important
> is how the MAC driver handles this, it needs to mask the value passed
> to the PHY. Assuming this has been tested on real hardware, it
> probably does.
> 
> 	 Andrew
 
  Yes, this has been tested on real DP1000 hardware.

  The DP1000 MAC integration provides the fixed RGMII TX/RX delays and
  masks the delay flags before passing the interface mode to the PHY.
  With `phy-mode = "rgmii-id"`, link establishment and network traffic
  work correctly in our testing.

  Thanks,
  Xincheng

-- 
Xincheng Ji <jixincheng@ultrarisc.com>

