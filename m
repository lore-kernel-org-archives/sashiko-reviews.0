Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF100347BD7;
	Thu, 30 Jul 2026 14:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785420837; cv=none; b=gzI6Vd1c6Br0kz98Su+rDBogjncta4B/+hi8w5i4//W3rNNcdi9/tX7k6cGkDQPkym50fRQRFEE1epN6oJLi0GfYnNB/BP5RwmvMgsFy+s7Wt3Z5VdTsVmZmWtvuNDOjMbfE6veJeR6jxfZ8w3I7SlUT5dBbjuv6wpJbq6yVVDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785420837; c=relaxed/simple;
	bh=axofcvun7XcWE8IeXc0S1Tui38f+OoEDJgB7ZB8duNA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q0r1TVKd2dbsNFH1zfJKTBtFCaGOeT+SzSIIIO1XHsnqxVrNoOlonn0RJGIFPiCoXO0EOGiF0dYeR7Y1qSKHWCUq1asucL+SEVLxVuLwCKNb23h/UgfnUzpKgLRW0f2P8Q0yLjTdCfbc49odH/3tLElGJ6GxaBhtvQ68Zi8xHB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2qQxBvK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2qQxBvK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040B21F00A3D;
	Thu, 30 Jul 2026 14:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785420836;
	bh=3RxfctGmL/FgTZ/YU2LMud4uponhhpLGkT6ewhWPZZU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=S2qQxBvKAUWnJn9NGEGHe/vywX73b7yE/wW/7axe0RZcaE0xeC9UY5Gwm7tHvq/ra
	 ZPR55sCsgjHkIDf+NtEaH+Pv32GRiDcKBfnQUPFmEo8O/ob4XKnjsEdTYY7EsXnJO/
	 QPXq3CtkUgo6oN+r6grkQRSObJDNfAOv2OQgbUvmZyhgUV7QcLbWWQF11SdnvwUZ+7
	 q/tL8csYGh53euZb4ckiijH3QNAfZuoi66GnqLKUVDUtwGqLh0uGCOpOGZud/EypMM
	 5rTF6H1eAeC7vt6NnCTzlZzyywc/4LhmCDTJ4KRfSEmP6Q//x5Fd83oZ7d4TSFb98K
	 LLZ9OMqhchY6Q==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: sashiko-reviews@lists.linux.dev, Mattijs Korpershoek
 <mkorpershoek@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 neil.armstrong@linaro.org, olteanv@gmail.com,
 linux-phy@lists.infradead.org, vkoul@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add sa8255p high-speed USB PHY
In-Reply-To: <20260730140606.08BEC1F000E9@smtp.kernel.org>
References: <20260730-phy-qcom-snps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org>
 <20260730-phy-qcom-snps-femto-v2-8255-v1-1-8b8bf5105a68@kernel.org>
 <20260730140606.08BEC1F000E9@smtp.kernel.org>
Date: Thu, 30 Jul 2026 16:13:54 +0200
Message-ID: <878q6sy38d.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 14:06, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Missing hardware-specific PHY tuning parameters for the Synops=
ys Femto High-Speed USB PHY V2.
> --
>
> --- Patch [1]: [PATCH 1/2] dt-bindings: phy: Add sa8255p high-speed USB P=
HY ---
> commit 04bc91a6fe06261e099ae8fda1bb90e34d0f28fc
> Author: Mattijs Korpershoek <mkorpershoek@kernel.org>
>
> dt-bindings: phy: Add sa8255p high-speed USB PHY
>
> This commit introduces a new device tree binding for the Qualcomm SA8255p=
=20
> Synopsys Femto High-Speed USB PHY V2. It specifies that the hardware uses=
=20
> SCMI power domains to manage resources like clocks, interconnects, and=20
> resets, rather than defining them individually.
>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-p=
hy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-phy.yaml
>> new file mode 100644
>> index 0000000000000..09f7ca6e7f727
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-phy.yaml
>
> [ ... ]
>
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#phy-cells"
>> +  - power-domains
>> +  - power-domain-names
>> +
>> +additionalProperties: false
>
> [Severity: Medium]
> Since this IP block is still the Synopsys Femto High-Speed USB PHY V2,=20
> would board configurations for this platform still need to apply standard=
=20
> hardware tuning parameters (such as qcom,squelch-detector-bp)?
>
> While clocks and resets are abstracted into SCMI power domains here, the=
=20
> memory-mapped reg space is still provided and typically used to program=20
> these signal characteristics. With additionalProperties set to false,=20
> schema validation will fail for any board device tree that attempts to=20
> override these valid PHY tuning properties.
>
> Might it be necessary to include these tuning properties, perhaps by=20
> referencing a common schema, so that boards can safely tune squelch=20
> detection and pre-emphasis without triggering validation errors?

No, from the testing I've done it's not needed to add any PHY tuning proper=
ties.

>
>> +
>> +examples:
>> +  - |
>> +    soc {
>
> [ ... ]
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-phy-qcom=
-snps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org?part=3D1
