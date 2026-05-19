Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8103A1CF3
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 06:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779173754; cv=none; b=lgVApMMF6nF2fBFxrUqZMy0oYh69HjCU1kTq40AsUh/lSlrHzzZfYjynT14+1PnWWU9NCPvE6FW5tcA5BUKY+T7tvlfY+UJ9qKzoe2pgR5PICxvO+Wjs0TtNWSxrr2pnD84Kb0G4Np+NIFiQV2gP0Ue33AnCmaSoFBiwzD3V5SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779173754; c=relaxed/simple;
	bh=dYE4AApZFhLZjpKQpGXrC4Tf3oqVMEplO+zE9uAR8cQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=IJAqqeJASLDTRGUOz+6EQIopPoOs0bZLE+xQnSskHeaddy+w2+tKgV9wRhpj1HWJhPND0ahkr4fBkxoKLZjqDMWuVRnn2yV6yqpHttn7NCAFHcQa8d3Q0waapPtL7ohjxaR2SJwcrArNskkIFYSE3ONVxkD0AQeMpNhzoTqjXCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=qz6FknnX; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="qz6FknnX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=BLCfAvmO7/A3EPN8rkPtqd9egvTbT4ODi
	hJiZkiN3uM=; b=qz6FknnXYNblOLJsbXbgnAaNhXd5W95z7zRDtua2ubSQT6iqV
	jQOyorm58Pq5bpAWcMn3nhNaNda+Tpom5GDEK8YdPcaXJntkRO9S4kbnHmG7pw7j
	3Dvhv2E/pFyug8E3MykL3NFnTm4I63nQVc/19UhQkWJYenoASCxYBHrvdg=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUJ_CQxq3tIEAA--.6315S2;
	Tue, 19 May 2026 14:55:59 +0800 (CST)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 5/9] riscv: dts: ultrarisc: Add initial device tree for
 UltraRISC DP1000
From: Jia Wang <wangjia@ultrarisc.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>, 
 krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, 
 conor+dt@kernel.org
In-Reply-To: <20260515020249.AAE16C2BCB3@smtp.kernel.org>
References: <20260515-ultrarisc-pinctrl-v1-5-bf559589ea8a@ultrarisc.com>
 <20260515020249.AAE16C2BCB3@smtp.kernel.org>
Date: Tue, 19 May 2026 14:55:18 +0800
Message-Id: <177917371892.3328776.8027306472566945764.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779173719; l=5468;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=dYE4AApZFhLZjpKQpGXrC4Tf3oqVMEplO+zE9uAR8cQ=;
 b=y7WpbrtrUHKLtTBDhxKywax9V9Xxzi5xewjPmhllKJTC2ZutUOqD2I/Mf5V0FNGeE50DHnSKN
 u5GXMPXmRryDbiigoSMiKIy1T/jMpraxb94xqEOW4qopWdu6orhnU94
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnYUJ_CQxq3tIEAA--.6315S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuw45JFWrWw1xJr4xCr1xKrg_yoW7WrW5pa
	y3WFW5Cr4kJr4IywsFqw1UAa43J3WDAFW3Wr1DCryY9rs09Fy0yrWIka1UXry8Xr4kuwnF
	qF45u348tw1DuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	c2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWU
	twCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUgt
	r4UUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQALEWoKjMQAHAACst

On 2026-05-15 02:02 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] The `gpio-ranges` property values in `gpio_b`, `gpio_c`, and `gpio_d` incorrectly specify a local GPIO base that exceeds the available pins.
> - [High] PCI I/O space is incorrectly mapped 1:1 to a high CPU address, breaking legacy PCI endpoints.
> - [High] The Ethernet node incorrectly defines a broadcast MAC address as its local unicast MAC address.
> - [Medium] Mismatch between CPU node unit addresses and their `reg` properties.
> - [Medium] Ethernet compatible strings are listed in the wrong order.
> - [Low] Clock node names contain underscores instead of hyphens.
> --
> 
> commit f5aec289ca4daa2ae7f4c27bac4b1694ece4043b
> Author: Jia Wang <wangjia@ultrarisc.com>
> 
> riscv: dts: ultrarisc: Add initial device tree for UltraRISC DP1000
> 
> Add the base device tree for the UltraRISC DP1000 SoC. It describes the
> 8×CP100 CPU cores and essential SoC peripherals including the interrupt
> controller, pinctrl, GPIO, UART, SPI, I2C, PCIe, GMAC and the DMA
> controller.
> 
> Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-2-98935f6cdfb5@ultrarisc.com/
> Link: https://lore.kernel.org/lkml/20260429-ultrarisc-serial-v7-3-e475cce9e274@ultrarisc.com/
> 
> > diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi b/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi
> > new file mode 100644
> > index 0000000000000..1aae53fc1a2b1
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi
> > @@ -0,0 +1,851 @@
> [ ... ]
> > +		cpu4: cpu@4 {
> > +			compatible = "ultrarisc,cp100", "riscv";
> > +			reg = <0x10>;
> 
> Does the unit address in the node name here correctly match the first
> address specified in its reg property?
> 
> The Devicetree Specification mandates that the hexadecimal value after the @
> must exactly match the reg value to avoid parser errors and dtc compiler
> warnings. Should these be renamed to cpu@10, cpu@11, cpu@12, and cpu@13?
>

The unit address should match the reg value. I'll rename them to
cpu@10..cpu@13 in v2. Thanks.
 
> [ ... ]
> > +	clocks {
> > +		device_clk: device_clk {
> 
> Is it intended to use underscores in these clock node names?
> 
> Device tree naming conventions generally require node names to use hyphens
> instead of underscores (e.g., device-clk) to avoid triggering strict
> character warnings.
>

Will rename to use hyphens in v2.
 
> [ ... ]
> > +			gpio_b: gpio-port@1 {
> > +				compatible = "snps,dw-apb-gpio-port";
> > +				reg = <1>;
> > +				gpio-controller;
> > +				#gpio-cells = <2>;
> > +				snps,nr-gpios = <8>;
> > +				gpio-ranges = <&pmx0 16 0 8>;
> 
> Will operations on local GPIOs 0-7 have a valid pinmux mapping with this
> configuration?
> 
> The gpio-ranges property uses the format <pinctrl_phandle gpio_base
> pinctrl_base count>. By specifying a local gpio_base of 16 for a port with
> only 8 pins, it seems gpiolib will fail to configure pins 0-7 correctly.
> 
> Should this be inverted to <&pmx0 0 16 8> to map local GPIOs 0-7 to
> pinctrl pins 16-23? This appears to be similarly configured for gpio_c and
> gpio_d as well.
>

Good catch. Will fix the gpio-ranges mapping for gpio_b, gpio_c, and gpio_d
in v2. Thanks.
 
> [ ... ]
> > +		pcie_x16: pcie@21000000 {
> > +			compatible = "ultrarisc,dp1000-pcie";
> > +			reg = <0x0 0x21000000 0x0 0x01000000>,
> > +			      <0x0 0x4fff0000 0x0 0x00010000>;
> > +			reg-names = "dbi", "config";
> > +			ranges = <0x81000000  0x0 0x4fbf0000  0x0 0x4fbf0000  0x0 0x00400000>,
> 
> Can legacy PCI endpoints and HBAs that only decode 16-bit I/O addresses
> successfully initialize with this mapping?
> 
> The ranges property maps the CPU MMIO address 0x4fbf0000 directly to the
> PCI bus I/O address 0x4fbf0000 (indicated by the 0x81000000 bitfield).
> Would it be better to map the CPU MMIO region to a PCI bus I/O address of 0
> instead?
> 

Will change PCI I/O address to 0 in v2.

> [ ... ]
> > +		ethernet: ethernet@38000000 {
> > +			compatible = "snps,dwmac", "snps,dwmac-5.10a";
> 
> Could the OS prematurely bind to the generic driver before applying
> hardware-specific driver quirks with this ordering? Device tree bindings
> typically require the compatible array to be ordered from most specific to
> least specific.
> 

Will reorder in v2.

> > +			reg = <0x00 0x38000000 0x00 0x1000000>;
> > +			clocks = <&csr_clk>;
> > +			clock-names = "stmmaceth";
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <84>;
> > +			interrupt-names = "macirq";
> > +			local-mac-address = [ff ff ff ff ff ff];
> 
> Will the network driver initialize with an invalid broadcast MAC address if
> the bootloader does not dynamically overwrite this value?
> 
> Using a broadcast address as a source MAC violates IEEE 802.3 standards,
> and upstream network switches may drop packets sent by this interface.
> Should this be omitted or zeroed out as a placeholder?
> 

Will remove the local-mac-address placeholder in v2. Thanks.

> > +			max-speed = <1000>;
> > +			phy-mode = "rgmii-id";
> > +			snps,txpbl = <8>;
> > +			snps,rxpbl = <8>;
> > +		};
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com?part=5
> 

Best Regards,
Jia Wang


