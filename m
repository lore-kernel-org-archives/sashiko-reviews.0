Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A72D2356D9
	for <sashiko-reviews@lists.linux.dev>; Sat,  6 Jun 2026 05:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780725466; cv=none; b=dLNCRqOSGiAPdyvH3S4L9C5gZKWcWWDB1LUquBg7yMTJezawAd2jgsmnT5+KhCXDNPTWJsSf6iOVTkPrcI2maf12YXoxth+zm3Ukjmw/VY/78UM3FiEvNkgsBzRrJw2SYuaVhnDn7uZ2XikO+RNNvC7zboLbRAK32PWUOTo+3no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780725466; c=relaxed/simple;
	bh=OYenO9hv+4Q5MAIk9Trfdi3xTWeNFZScrLZSmUlASIQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Yn6OnhZGqguYmmeKBmbwTRFxvELVI7oyt7mBgzOivSEjpLfqYVqXwolZo/t6iY+zJGkqafS+acatVBUlTmR8QbH0wVR3G3p9aCedoQa16tqQD7tFPbyHHCCibo5rHe3RNGEuuV3Z4QdoDiNxwT+QrgL/OQCFO+b9JCcq9bgG4Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=TaQgKyrH; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="TaQgKyrH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=+GBkWRX6H9gOUgMZTnqGbya6xJVuSSQvz
	zT0etgBV+M=; b=TaQgKyrHvxnPMCr8ST9G89t6IoU/Ok2s9DuiCYAByE+ojULFj
	lz33sJpU4oUiSlh0Bf3EYHxAq+obRttPbsfUo9J8T6rAs2MLtGgM33Yx/Ypv+TyS
	TIAbnO5CGgg23Y//1DbeWGcpeI0VZ3R3MmjQax/jjKACoV0thiI0GAPOo4=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYULFtiNqCvAIAA--.8801S2;
	Sat, 06 Jun 2026 13:57:25 +0800 (CST)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: Add UltraRISC DP1000
 pinctrl controller
From: Jia Wang <wangjia@ultrarisc.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>, 
 devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601100602.A4F931F00898@smtp.kernel.org>
References: <20260601-ultrarisc-pinctrl-v2-1-07ac5130a96d@ultrarisc.com>
 <20260601100602.A4F931F00898@smtp.kernel.org>
Date: Sat, 06 Jun 2026 13:56:47 +0800
Message-Id: <178072540755.310568.3446097812860239551.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780725407; l=2510;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=OYenO9hv+4Q5MAIk9Trfdi3xTWeNFZScrLZSmUlASIQ=;
 b=7Ou+5/kb4W5x2QMzJFxdho5Zou+1EgZ/QRO0YXlvEsG/7N0bX73L/8lt1n/lBjRWEmWXRBvOb
 JM/DwBXX9tOCep3d9yNR9wUQRxwghs8lUJe3A5oh/5ZKm2m5HvDT2Hj
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnYULFtiNqCvAIAA--.8801S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWUKFW7ZrWfKFyDAFyxKrg_yoW8Kry5pF
	ZxGFWayFy8XrW3J3y8t3W8Zw1fJw4xAFW3Aan0q340vayYgFn7tFZIkw45Xan8WrW8tFyS
	qa45W3sFv3WDAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkEb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCY
	02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07boDG
	rUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWoWakYABgAnsh

On 2026-06-01 10:06 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The conditional schema constraints fail to prevent non-LPC pins (Ports A-D) from being assigned the 'lpc' or 'espi' mux functions.
> --
> 
> commit 579eeac83b351ad50317d72079e0436d73706e08
> Author: Jia Wang <wangjia@ultrarisc.com>
> 
> dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl controller
> 
> This commit adds the device tree binding documentation for the pin controller
> found on the UltraRISC DP1000 RISC-V SoC. It defines properties for ports
> A-D and LPC pins, including supported mux functions and pin configurations.
> 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
> 
> [ ... ]
> 
> > +patternProperties:
> > +  '.*-pins$':
> > +    type: object
> > +    unevaluatedProperties: false
> > +    allOf:
> > +      - $ref: /schemas/pinctrl/pincfg-node.yaml#
> > +      - $ref: /schemas/pinctrl/pinmux-node.yaml#
> > +      - if:
> > +          properties:
> > +            pins:
> > +              contains:
> > +                pattern: '^LPC([0-9]|1[0-2])$'
> > +        then:
> > +          properties:
> > +            function:
> > +              enum:
> > +                - lpc
> > +                - espi
> 
> [Severity: Low]
> Does this schema allow Ports A-D to incorrectly select the lpc or espi
> functions?
> 
> The if-then block restricts LPC pins to the lpc or espi functions, but it
> appears to lack a reciprocal constraint preventing non-LPC pins from being
> assigned to these functions.
> 
> Because lpc and espi are included in the base function enum defined later in
> the schema, an invalid device tree might silently pass schema validation if it
> mistakenly assigns the lpc or espi functions to Ports A-D.
> 
> Would it be helpful to add an else clause here, or a separate if-then block,
> to explicitly forbid lpc and espi on non-LPC pins?
>

Thanks for the review. I'll update the schema to also reject lpc/espi
functions on non-LPC pins in v3.
 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260601-ultrarisc-pinctrl-v2-0-07ac5130a96d@ultrarisc.com?part=1
> 

Best regards,
Jia Wang


