Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A099C2C8
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 05:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129598; cv=none; b=nc852fKrJ0rBfLTOgF2+5zHJBDqUvhCtmcYzJZap6Sf4o3V9HWm5IuSlRbmoqJ8jl6utADhUZZoNvWBPK2++whj6eVCHWXUee6644YlBINgTkoSiTzCFcY/SsZrKgEdPoE2n1+YWT9GH0SXpmMAryIP1DwZKj8nu5zGEc9nvscw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129598; c=relaxed/simple;
	bh=H/wLC77nyWi4TKzai2xbbOaPR7KYDq5gbSIw52DfucI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=NNZJnpr3hFIlL6kRJXoTE49Q3w6fqU/Yzs8x4u0WT4rFtyZDvTqUvILxEOm0aGVZNAhjkNISmjJq2PhROe3urPzJNxKim0jpdLR0lQvuxeULg2KHNVhsU7OtVtl8D5W5RrbpxwdpN8lY9xk/f74ZcnBUHT3PKXtS0KiY5ga586A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=AOu8G//r; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="AOu8G//r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=au/In2S6Zw9QAy1t6b5ulyOfJEmxfJagH
	+pXKcr29cE=; b=AOu8G//r+cz1NzGdXe/GViFvzW9kWYbWd+NGxY+aXGImKkgF6
	65QJXNfJszHKRTUSMSxL4BahB4kdHFb18mI4FkePzLvVw36BWq74F67ZDxjJD8ZR
	G9Tr6w5TkyevGApdezXQldwGUtbyAhwVCqpay0sRwYGJedMKDpk6C56Img=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwD3vwYqutFqSzECAA--.1058S2;
	Fri, 16 Oct 2026 13:46:28 +0800 (CST)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 5/7] riscv: dts: ultrarisc: Add initial device tree
 for UltraRISC DP1000
From: Xincheng Ji <jixincheng@ultrarisc.com>
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, Xincheng Ji <jixincheng@ultrarisc.com>, 
 devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-ramp-dioxide-63e1d5e0499f@spud>
References: <20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com>
 <20261013-ultrarisc-dts-v3-5-5ff3ebb2a90d@ultrarisc.com>
 <sashiko-outbox-169523@kernel.org>
 <20261014-ramp-dioxide-63e1d5e0499f@spud>
Date: Fri, 16 Oct 2026 13:46:17 +0800
Message-Id: <179212957763.1275455.3064080898743829943.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792129577; l=1889;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=H/wLC77nyWi4TKzai2xbbOaPR7KYDq5gbSIw52DfucI=;
 b=G/dseTYRalYRLNbQPqcmVRTWZCsy+AkMe9cOm4ArIZyIMkcE0sLk+D9xKHIbqkD8euyBJQK3P
 l06EfeNFhB6BLDH1dOKhT6pd5HxFDm/73W8QfKIJK9+2uReH2ifb8NR
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-CM-TRANSID:AQAAfwD3vwYqutFqSzECAA--.1058S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr45KFykWryfZrWxJFykAFb_yoW8WF4xpw
	s7Ka4UtF4kZr1xCwn2vF1Uu3WIvas7GF4Yqwn5Ww48AryY9r17JFWrKw15ZFy5WryxCr42
	vF4Fv3yIgws8GaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvI14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
	9x0JUSNtxUUUUU=
X-CM-SenderInfo: pml0x0xfkh0wg6xo325dul2uoofrz/1tbiAQAJDmq-VKkAAgAtsB

Hi Niklas,

On 2026-10-14 17:53 +0100, Conor Dooley wrote:
> > > + cpus {
> > > +         #address-cells = <1>;
> > > +         #size-cells = <0>;
> > > +         timebase-frequency = <10000000>;
> > > +
> > > +         cpu0: cpu@0 {
> > > +                 compatible = "ultrarisc,cp100", "riscv";
> > [ ... ]
> > > +                 cpu0_intc: interrupt-controller {
> > > +                         compatible = "riscv,cpu-intc";
> > > +                         interrupt-controller;
> > > +                         #interrupt-cells = <1>;
> > > +                 };
> > > +
> > > +                 l2_cache0: l2-cache {
> >
> > [Severity: Medium]
> > Does this incorrectly nest the L2 cache nodes as children of the cpu nodes?
> >
> > Standard Devicetree topologies for CPU schemas require cache nodes to be
> > defined as siblings under the /cpus node or globally, rather than as direct
> > children of the cpu nodes. Instantiating l2-cache here can cause
> > dt_binding_check validation failures and break generic kernel cache topology
> > parsers that expect the cache nodes at the root of /cpus and referenced via
> > the next-level-cache phandle.
> >
> > Should these cache nodes be moved outside of the cpu@0 node?
>
> This seems like a fairly reasonable comment from Sashiko. Does keeping it
> here lead to hwloc incorrectly displaying your topology?

Thank you for pointing this out. You are right: after reviewing the
relevant Devicetree bindings and implementations from other vendors,
we found that the current L2 cache node placement is not compliant 
with the standard topology.

The L2 cache nodes should be defined as siblings under /cpus (or globally) 
and referenced via next-level-cache, rather than being children of the CPU 
nodes. We will fix this in v4.

Thanks,
Xincheng

-- 
Xincheng Ji <jixincheng@ultrarisc.com>

