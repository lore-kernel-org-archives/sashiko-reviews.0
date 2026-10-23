Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=218.76.62.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742716;
	b=KghTB502Q+ATMLXWSGTxUa50sniiQuC0O4JRKmxf8nu0Istuzreta4taS52xB3KCuZY/
	 eSeQs65Byv3QgC3kVED5uDIf4KT6V7QJiTyCSinF19S8H6M6aBS5+9d2Pa5ekbw/aQcs8
	 A+rhdOam79Sf6A9VlagOPyBWD+fItt7AJzXaSe573OaYbTO8pGECThUoSXjftDenYUkfU
	 MZQ7UqFO4oz+NLEKrzKt8gvUeL/n5ujYQqoTJNH1F9z1JzCJp7jk52L50hdV0OzTVboBx
	 5n7joIDGL0zs3Ky+N+31ZDyAeCQ7/8aP7afidms8efkHo7GODYLELWjwhy3q0GksUVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742716;
	h=DMARC-Filter:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=h6o9SwfelZk8ppL9HSu/L1TGVEjtLWc6TAu626v9Q5s=;
	b=s+SneWUuM6hd1rawoJeHbDCGA/5bveSSOtR/YEjrhXSo8R/Wx1qznyYjpDArjCgafwaQ
	 Mvtt0nNAbwtqeVje40E4UDSFeicDVQCtQNf7Jr31uIQjyp64pY6RdnQabUrLwbRK1C6V6
	 gP7LC0tFcgfZsoVFpkX7Ttp6TI3rl3W5Elg4EUpRv1EC8UXP5i+BEEM2JBG+c6CSRsxZk
	 c3x4dziaZF5Q5po/NwNynrru7ZGTO5OwQ/9UbCce+ZrGBLiqt0IUFDOrVqtTT7q6qNfux
	 WCTjXj6ideydAp2HEKiX/pmeSG9b7MH9JO03ho8r37mM894I7Y8qS8cOCsdW0nmk6Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ultrarisc.com;
	spf=none smtp.mailfrom=ultrarisc.com;
	dkim=pass header.d=ultrarisc.com header.i=@ultrarisc.com header.a=rsa-sha256 header.s=dkim header.b=QIhIAeIX;
	arc=none smtp.remote-ip=218.76.62.146
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24530606A31B
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 08:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24530606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ultrarisc.com header.i=@ultrarisc.com header.a=rsa-sha256 header.s=dkim header.b=QIhIAeIX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=h6o9SwfelZk8ppL9HSu/L1TGVEjtLWc6T
	Au626v9Q5s=; b=QIhIAeIXBG/5voS7aWC/1iX0ZPNwu5BwxXMJjt1he8e037bKC
	C8xHsYDXqAHwfoyEX+8jrimO5+V0K0vMrs4Jv44kmI1PBcaR7JY3b8dtsyBKGGdd
	/bZY8QKVzV6zhMCWmKCDHdZuh9GzqkJLZ9eO3W0/iABa8MlXjLZIByQeQQ=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwCnYwUqFdtqtKkCAA--.869S2;
	Fri, 23 Oct 2026 16:04:58 +0800 (CST)
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
Subject: Re: [PATCH v5 5/7] riscv: dts: ultrarisc: Add initial device tree
 for UltraRISC DP1000
From: Xincheng Ji <jixincheng@ultrarisc.com>
To: sashiko-reviews@lists.linux.dev
Cc: Xincheng Ji <jixincheng@ultrarisc.com>, devicetree@vger.kernel.org, 
 robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <sashiko-outbox-182213@kernel.org>
References: <20261023-ultrarisc-dts-v5-0-af79dbd6ccec@ultrarisc.com>
 <20261023-ultrarisc-dts-v5-5-af79dbd6ccec@ultrarisc.com>
 <sashiko-outbox-182213@kernel.org>
Date: Fri, 23 Oct 2026 16:04:59 +0800
Message-Id: <179274269908.1621199.15312490337307250677.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792742699; l=1823;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=qlegkJsgPEOWIMA1R53vSHk44nz0KpgKyHdI6PUIfqs=;
 b=a1oWf3UfFQDD5yjqkU0f33o/SHeIKlNN0cc9sFDRG82X4yzQOecY2yXkYJxP/4Rp1d6Lgtnph
 x/wk8rMC2m8AAwOPYw4m8oEMUCc/0BVhkcTnViTbXdrVxortr02B7fs
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-CM-TRANSID:AQAAfwCnYwUqFdtqtKkCAA--.869S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4kJrWDXryxJry8Kr1xKrg_yoW8Ar47pF
	WUur4YqF4vqr15Gws2vF1UCwsrGa17CFyvq3ZFqFWYyrnIvw4FvryDJwn3GF1rW34DZwnF
	vF4Fvw1rK3W7K3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUva14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
	uYvjfUe0PSUUUUU
X-CM-SenderInfo: pml0x0xfkh0wg6xo325dul2uoofrz/1tbiAQAHDmrYYSwADQATsp

On 2026-10-23 02:10 +0000, sashiko-bot@kernel.org wrote:
> > +	soc {
> > +		compatible = "simple-bus";
> > +		ranges;
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +
> > +		clint: clint@8000000 {
> > +			compatible = "ultrarisc,dp1000-clint", "sifive,clint0";
> > +			reg = <0x0 0x8000000 0x0 0x100000>;
> > +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> > +					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> > +					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> > +					      <&cpu3_intc 3>, <&cpu3_intc 7>,
> > +					      <&cpu4_intc 3>, <&cpu4_intc 7>,
> > +					      <&cpu5_intc 3>, <&cpu5_intc 7>,
> > +					      <&cpu6_intc 3>, <&cpu6_intc 7>,
> > +					      <&cpu7_intc 3>, <&cpu7_intc 7>;
> > +		};
> > +
> > +		plic: plic@9000000 {
> > +			compatible = "ultrarisc,dp1000-plic", "ultrarisc,cp100-plic";
> > +			reg = <0x0 0x9000000 0x0 0x4000000>;
> > +			#interrupt-cells = <1>;
> > +			#address-cells = <0>;
> > +			interrupt-controller;
> 
> [Severity: Low]
> Should the plic node in arch/riscv/boot/dts/ultrarisc/dp1000.dtsi be named
> interrupt-controller@9000000 instead of plic@9000000?
> 
> Because this node has the interrupt-controller property, dtschema's
> interrupt-controller.yaml and
> Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> require the node name to match interrupt-controller@<addr>, otherwise running
> dtbs_check on boards including dp1000.dtsi will report a nodename validation
> warning.
Thanks for pointing this out. While checking the other nodes, I also
found similar naming issues with the PHY and CLINT nodes. I'll update
these along with the PLIC node to follow the generic naming conventions
in the next revision.

Best regards,
Xincheng

-- 
Xincheng Ji <jixincheng@ultrarisc.com>

