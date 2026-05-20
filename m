Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9FE3CAE63
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779270010; cv=none; b=G5Z7AhUqSCvqrJFRcvQc3jO9li/gjjo8jIj8ku2/Bql5ravW6b4ZH07FksXPaO7nOMuzntKrFG3fx2gL5gl5OApJysUG2vw5Bb2GdnlNfIhIe6Bno81pmJ+v7swJiImUn918aXqvF1V6FEHyiEZgaRG0isCpszg3kHUKhcGOvJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779270010; c=relaxed/simple;
	bh=2/RyurmNHH2WY/wo+sv7UyB7+FpGY+NxS2Wf8peT32c=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=d9vPwve+DRwU22h+idmTiO5JDLn7i+n+I2y42zqRX3Ldcyal0ZgZNzmisSt4pJBGSr6kiaycNl06MBr3SLw2DbXblX1bIXLAuHDTl1OUb3hlCveh1f9K3w7GXdDMNVzNke9IuN9kVfhhSWz4RUU+/cDgV7mKMS2F99jWHdviyqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=Ln3TjSBj; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="Ln3TjSBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=iMz+PI7CIo0HmAyICAXdHA8CpLRCcd0q4
	l43IWGSuUE=; b=Ln3TjSBjpkedopafP3M3LE//C8uihY92p+OCqHX5m3C6ceoVr
	CbbLEh5fhIEaMymk+4Vs3T88FUYhwvjjy6aPwQVxKO+FiORZhO18gs/BXh64H7Eo
	B5846o4y73v+t5Hpn26nfaRgqEBF0pDbuaHgQ9+G0Py5d7GtqJ4TvcAKjk=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkORgQ1qNPAEAA--.6815S2;
	Wed, 20 May 2026 17:40:33 +0800 (CST)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 8/9] riscv: dts: ultrarisc: add Milk-V Titan board
 device tree
From: Jia Wang <wangjia@ultrarisc.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>, 
 conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, 
 robh@kernel.org
In-Reply-To: <20260515025043.D1C5BC2BCB3@smtp.kernel.org>
References: <20260515-ultrarisc-pinctrl-v1-8-bf559589ea8a@ultrarisc.com>
 <20260515025043.D1C5BC2BCB3@smtp.kernel.org>
Date: Wed, 20 May 2026 17:39:52 +0800
Message-Id: <177926999235.943957.8105503287379543005.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779269992; l=3659;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=2/RyurmNHH2WY/wo+sv7UyB7+FpGY+NxS2Wf8peT32c=;
 b=DEhWnHmb/gMKxp1FQ6uWk8zxPIAUIohffRq0BWlbMwMsi8BNQPVCsy4NHWUAgVIHva688HwZY
 2vii8KTLjlOCdN0aZyUm4ohHJWQOMx28E8OkcOH5nh0YeE6Y+Um+P2b
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnEkORgQ1qNPAEAA--.6815S2
X-Coremail-Antispam: 1UD129KBjvJXoWxurWUZw15CryrtrWDCr4xXrb_yoW5KF4UpF
	ZxGFW5GFZ7JFWrtw42vFW5Cr13Jr4rCFW3Ar1UKFy8Arn8uw1vyw1vkwsYvF4kXrWkWw1U
	ur15uryIyw1v93DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
	Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	boKZAUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQANEWoNL8UAJwABs2

On 2026-05-15 02:50 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The GPIO pins used for board-level multiplexers (`PA5`, `PA6`, `PA7`) are configured with the `gpio` pinmux function but are not driven to any defined state.
> - [Low] The `gpio-poweroff` and `gpio-restart` nodes are explicitly defined in the board device tree but are left with `status = "disabled";`.
> --
> 
> commit f0b973e0e230934a238fa1f5d39b91d61efc3d7b
> Author: Jia Wang <wangjia@ultrarisc.com>
> 
> riscv: dts: ultrarisc: add Milk-V Titan board device tree
> 
> This commit adds the device tree for the Milk-V Titan motherboard based on
> the dp1000 soc.
> 
> > diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi
> > index 0000000000000..053206190ec75
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi
> [ ... ]
> > +	mux_dcdc_pins: mux-dcdc-pins {
> > +		pins = "PA5";
> > +		function = "gpio";
> > +	};
> > +
> > +	mux_i2c3_pins: mux-i2c3-pins {
> > +		pins = "PA6";
> > +		function = "gpio";
> > +	};
> > +
> > +	mux_uart0_pins: mux-uart0-pins {
> > +		pins = "PA7";
> > +		function = "gpio";
> > +	};
> 
> [ ... ]
> 
> > diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts
> > index 0000000000000..21d85c03abe12
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts
> [ ... ]
> > +	gpio-poweroff {
> > +		compatible = "gpio-poweroff";
> > +		gpios = <&gpio_b 0 GPIO_ACTIVE_LOW>;
> > +		active-delay-ms = <100>;
> > +
> > +		status = "disabled";
> > +	};
> > +
> > +	gpio-restart {
> > +		compatible = "gpio-restart";
> > +		gpios = <&gpio_b 1 GPIO_ACTIVE_LOW>;
> > +		active-delay = <100>;
> > +
> > +		status = "disabled";
> > +	};
> 
> Is it intended to leave these nodes disabled in a final board device tree?
> 
> Defining board-level features only to disable them might leave functionality
> unexpectedly unavailable or litter the tree with dead code. If the hardware
> supports these features, should they be enabled to provide power-off and
> restart functionality?
>

The platform uses the OpenSBI SRST extension for reset/poweroff, so these
disabled GPIO nodes are unnecessary. 

I'll drop them in v2.
 
> [ ... ]
> > +&gpio {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&io_pins &mux_dcdc_pins &mux_i2c3_pins &mux_uart0_pins>;
> > +};
> 
> Does this configuration leave the multiplexer pins in a floating state?
> 
> The mux_dcdc_pins, mux_i2c3_pins, and mux_uart0_pins configure the PA5, PA6,
> and PA7 pins to act as gpios and are applied to the default state of the gpio
> controller here. However, configuring a pin to gpio mode only routes it to
> the gpio controller without configuring the direction or output level.
> 
> Without a driver or gpio-hog nodes explicitly setting these pins as outputs
> and driving them high or low, they will default to inputs. This might lead to
> unpredictable hardware behavior, potentially disabling the dcdc converter,
> i2c bus, or the system console. Could this be addressed by adding gpio-hog
> configurations?
>

You're right that these pins would default to inputs. I'll address this by
adding the appropriate gpio-hog configurations in v2.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com?part=8
> 

Best Regards,
Jia Wang


