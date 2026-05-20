Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48AA93A2543
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 08:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779265609; cv=none; b=U9zJYiK3t3xO1SadSlilueGzoUiPOausF3birBmCc4cWj0XrJYJHY9YPgCBTggoC7dc6ps8lcJlpa3NwAvkRVjS9h4qKS8X8C/7//vC2mdfhJzpqZNbDInqOladQkULJYfdAf58EH0HG5m7s8NdqEkS4pTLQJEsoAv88D/4OHlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779265609; c=relaxed/simple;
	bh=SikzV54qPV+SmO8ll8VrBgCwg3h2sRXVBh2Dxg0vYPg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=bFtfQQMMQGtmQ3oIifNEIi4LlUYV2cQ9KV5zS00A1Q167RfLXTQU5UadnbjuReSJxOLtDWx/sJ9c6DB9HETiewnTEBG0vZOZZUcX9ghjdWF8K6rK9WO0Y5mryPglKKEHnlTZXgz4jWjr7qYMwXhrTFEjF5VLG+m/zzqOUZ6frRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=nujqIB4b; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="nujqIB4b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=UeabYTNBCYsM6QT4nmgSUxXOCuZvx5D0r
	82KfrjXtSc=; b=nujqIB4bTkNlkX3e/vKoK+yGKQ7U1+OzprNwwmVfjXK4ggRls
	NFh/fleUxYY6dSrSKsODtmmMOE99TiCdtTprVyLgDoerP0X8X21bInFkV4PuOreF
	abvt40R1l+pkD0VgBep76isjpcXO6Ynmpe8LquhlEGNTDZYPqkk3ldbrmc=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkNrcA1qwO4EAA--.6799S2;
	Wed, 20 May 2026 16:27:23 +0800 (CST)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 7/9] riscv: dts: ultrarisc: add Rongda M0 board device
 tree
From: Jia Wang <wangjia@ultrarisc.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>, 
 conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20260515023740.9BB6FC2BCB3@smtp.kernel.org>
References: <20260515-ultrarisc-pinctrl-v1-7-bf559589ea8a@ultrarisc.com>
 <20260515023740.9BB6FC2BCB3@smtp.kernel.org>
Date: Wed, 20 May 2026 16:26:42 +0800
Message-Id: <177926560256.943957.3878687939421695995.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779265602; l=4252;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=SikzV54qPV+SmO8ll8VrBgCwg3h2sRXVBh2Dxg0vYPg=;
 b=AEAERBpNEzg52zD9ZEtmbfdhfkZ/UxvTX1DJU+d2Y9EEVmrz5/0eUHDP21sZbpylyVAwh+Wcv
 jLesQxNoanTCvYG8ovSjyhInkNoEyxnHymIdDO06uJR39T/ncftI1fj
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnEkNrcA1qwO4EAA--.6799S2
X-Coremail-Antispam: 1UD129KBjvJXoWxurWUWw4rXry8Kr17Xw47Arb_yoWrWw17pF
	43WFZ8W3yDZr4Yvay2qFyrXF1fAF4xCFW3AF15Gry0ywn8ury0kF92gw4Yg3Z5Xryqqw1j
	9r13uFyIk3Z3uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
	Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	boKZAUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQANEWoL3kQAGQAEs7

On 2026-05-15 02:37 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] Unused hardware blocks (PCIe controllers and UART3) are left enabled without proper configuration.
> - [Low] Board-specific power management features (`gpio-poweroff` and `gpio-restart`) are explicitly disabled.
> - [Low] Unused PCIe link pin configurations conflict with actively used I2C2 pins.
> --
> 
> commit 024b81fdfc4200deef00a8435cf80efa58aed943
> Author: Jia Wang <wangjia@ultrarisc.com>
> 
> riscv: dts: ultrarisc: add Rongda M0 board device tree
> 
> This commit adds the device tree for the Rongda M0 mATX motherboard based
> on the UltraRISC DP1000 SoC. It configures pin controls, aliases, and
> active peripherals like I2C, SPI, UART, and Ethernet.
> 
> > diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi
> > new file mode 100644
> > index 0000000000000..101b416b10792
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi
> > @@ -0,0 +1,85 @@
> [ ... ]
> > +	i2c2_pins: i2c2-pins {
> > +		pins = "PC0", "PC1";
> > +		function = "func0";
> > +		bias-pull-up;
> > +		drive-strength = <33>;
> > +	};
> [ ... ]
> > +	pciex4a_link_pins: pciex4a-link-pins {
> > +		pins = "PC0";
> > +		function = "func1";
> > +		bias-pull-down;
> > +		drive-strength = <33>;
> > +	};
> > +
> > +	pciex4b_link_pins: pciex4b-link-pins {
> > +		pins = "PC1";
> > +		function = "func1";
> > +		bias-pull-down;
> > +		drive-strength = <33>;
> > +	};
> 
> Are these pciex4a_link_pins and pciex4b_link_pins configurations needed?
> They appear to use pins PC0 and PC1, which are also mapped to i2c2_pins and
> actively assigned to i2c2 below.
> 
> Since these PCIe link pin configurations are unused in the board device tree
> and conflict with the active I2C pins, could they be removed?
>

Will remove the unused pciex4a/b_link_pins in v2. Thanks.
 
> > diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts
> > new file mode 100644
> > index 0000000000000..6f72d60ad55e4
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts
> > @@ -0,0 +1,111 @@
> [ ... ]
> > +	aliases {
> > +		serial0 = &uart0;
> > +		serial1 = &uart1;
> > +		serial2 = &uart2;
> > +		serial3 = &uart3;
> > +	};
> 
> Is uart3 intended to be active on this board? It is aliased here but does
> not appear to be configured with pins or explicitly disabled.
> 
> If unused hardware blocks like uart3 or the PCIe controllers are left enabled
> in the generic SoC device tree without being explicitly disabled in the board
> device tree, could probing them waste resources or expose dangling interfaces?
> 
> Should unused IP blocks be explicitly marked with status = "disabled" in
> this board-level device tree?
> 

uart3 is routed out on this board. I'll keep the alias and add the missing
pinctrl configuration in v2. Thanks.

> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +
> > +	gpio-poweroff {
> > +		compatible = "gpio-poweroff";
> > +		gpios = <&gpio_b 0 GPIO_ACTIVE_HIGH>;
> > +		active-delay-ms = <100>;
> > +
> > +		status = "disabled";
> > +	};
> > +
> > +	gpio-restart {
> > +		compatible = "gpio-restart";
> > +		gpios = <&gpio_b 1 GPIO_ACTIVE_HIGH>;
> > +		active-delay = <100>;
> > +
> > +		status = "disabled";
> > +	};
> 
> Should these gpio-poweroff and gpio-restart nodes be included if they are
> explicitly disabled?
> 
> If the board is physically wired to support these features, could they be
> enabled by removing the status lines? If not, does it make sense to omit
> these nodes from the board file entirely?
> 

The board relies on the OpenSBI SRST extension as the active reset/poweroff
mechanism, so the disabled gpio-poweroff and gpio-restart nodes are indeed
unnecessary in the board DTS.

I'll drop them in v2.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com?part=7
> 


