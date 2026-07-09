Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7F0379C3C
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783594333; cv=none; b=gO/rFy4yGIdMu3kPQpafMT/UnZNVO92VxFoO11rYTSsb3Mr8efi39lyR7SmemDWQYufoj8yfY01M5sYpFcDsg/V0o/mbrW+c+D8Ntz0u+PY7A/+uzboXuomU4BTnRnxMNaRy1gGSRpcq78O3cBGytVaQdjlCXtr9AyfSGedYfYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783594333; c=relaxed/simple;
	bh=r6FjVnEXwE0IGEmKbTI/hDFm3Nf0DQ8S1T/ck81JAEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jr6Ni8bi4L2qWEebsrOeNyJWrV0/SBSNWLnOwEQji+KlYjc78PMBCHkz/so3Hl3bEPpcpPrSrsffoT39N+fXvODjg1ea1GSzg1UaMDlpZzlA4bXw/x++gxBP+Khlv8+C0GDlkUomG157OttKtxRBFi80oFsaEqOoLiMNS5xwYcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=h2ekCjMH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h2ekCjMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783594330;
	bh=r6FjVnEXwE0IGEmKbTI/hDFm3Nf0DQ8S1T/ck81JAEM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h2ekCjMHC5AgjXntNqWY2j4muZT4FhN2htvXPl6KTYk6Q165IBO2SsF+8avDrAiAB
	 EhRlP3kE/rtBT7T08UutOjZ0+eh2EJnuWkxuPSf6UcdNixIRWTr09OY8W2ap4y4tWk
	 HNkpSmpXODFp6wchiKv//DRKOxAVrC0A3ODgdVmC16tu1zKhfppxyTgOMl4ryDZnZ2
	 TsGTpWr1QlZL4/hGoSMJXgad7fYUfUGaeFspvSFQrXXz/b+XLWJBZmBlhoDG/JTay+
	 jjXJqxzewxs9WHRrPOrubkTnmrtNxLNtXNVZDm0KpyXDWOGKEdsEK4DYa2CvWjSCBh
	 XsUdhdJHIYmjw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E9ADA17E0886;
	Thu, 09 Jul 2026 12:52:09 +0200 (CEST)
Message-ID: <be903cb1-8184-4112-9672-ea262716e5b9@collabora.com>
Date: Thu, 9 Jul 2026 12:52:09 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: Chen-Yu Tsai <wenst@chromium.org>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Mark Brown <broonie@kernel.org>
References: <20260709081928.612294-1-wenst@chromium.org>
 <20260709083024.330381F000E9@smtp.kernel.org>
 <CAGXv+5HO5eWaJ-AhH9JG=aZ9f_se8L8Ebz-NRHfKMsNXvGnQTg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5HO5eWaJ-AhH9JG=aZ9f_se8L8Ebz-NRHfKMsNXvGnQTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/9/26 11:27, Chen-Yu Tsai wrote:
> On Thu, Jul 9, 2026 at 4:30 PM <sashiko-bot@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] The MT6319 PMIC fallback compatible triggers incorrect MT6315_PP mode ganging in the regulator driver, causing silent cross-talk between the CPU and EMI VDDQ regulators.
>> - [Low] Grammatical error in the comment explaining the firmware workaround.
>> --
>>
>> --- Patch [1]: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC ---
>> commit 0ff94c6622559a57199ed1f2d1f4063c6c911df1
>> Author: Chen-Yu Tsai <wenst@chromium.org>
>>
>> arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
>>
>> The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4X
>> DRAM.
>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>>> index 8e423504ec052..af05315092f53 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>> [ ... ]
>>> @@ -1225,6 +1235,70 @@ &spi2 {
>>>        status = "okay";
>>>   };
>>>
>>> +&spmi {
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&spmi_pins>;
>>> +     #address-cells = <2>;
>>> +     #size-cells = <0>;
>>> +     status = "okay";
>>> +
>>> +     pmic@6 {
>>> +             compatible = "mediatek,mt6319-regulator", "mediatek,mt6315-regulator";
>>> +             reg = <0x6 SPMI_USID>;
>>
>> [Severity: High]
>> Does this fallback compatible trigger incorrect mode ganging?
>>
>> The mt6315-regulator driver maps USID 6 to the MT6315_PP variant, which
>> hardcodes mode ganging for vbuck1, vbuck2, and vbuck4. On the MT8188
>> Geralt's MT6319, vbuck4 is wired as an independent regulator for
>> pp0600_emi_vddq.
>>
>> If a mode change happens on vbuck1 (which is allowed by the
>> regulator-allowed-modes property), the driver will apply the ganged
>> mask and silently overwrite vbuck4's mode bits in the PMIC, potentially
>> forcing the RAM supply into an unexpected mode.
>>
>> Could this silent cross-talk between the CPU and EMI VDDQ regulators
>> lead to memory voltage instability?
> 
> This discrepency is actually bigger than Sashiko mentions. The ganging
> supported by the driver only applies to the PMICs in the Asuarada design:
> 
>    - SPMI ID 6 has 1+2 (GPU); 3 and 4 are unused
>    - SPMI ID 7 has 1+2+4 (big cores) and 3 (little cores)
> 
> On the Cherry design we have:
> 
>    - SPMI ID 6 has 1+2 (GPU); 3 and 4 are unused
>    - SPMI ID 7 has 1+2+3+4 (big cores)
> 
> On the Corsola designs with beefier chips:
> 
>    - SPMI ID 6 has 1+2 (big cores); 3 and 4 are unused
> 
> On the Geralt design (this one):
> 
>    - SPMI ID 7 has 1+2 (big cores); 3 (DRAM); 4 (DRAM)
> 
> Any ideas on what to do about this mess?

wenst, I think that the only way to fix that properly is to add generic support
for buck phases ganging in the regulator API... because AFAIK there's nothing
right now.

 From what I remember from last time I looked, MediaTek PMICs wouldn't be the
only ones, there's something else that also has ganged bucks, and again if I
remember correctly, I remember seeing one platform data struct for each of the
ganging combinations in that driver.

So.. especially because MTK wouldn't be the first, I think the addition of some
kind of generic properties (and callbacks) for this kind of configuration in
the API would be both profitable and welcome.

Mark, any considerations?

Cheers,
Angelo

> 
> Another thing is that I kind of wonder why the mode configuration register
> setting isn't ganged in hardware like the enable and voltage settings.
> 
> 
> Thanks
> ChenYu
> 
>>> +             pvdd1-supply = <&pp4200_s5>;
>>> +             pvdd2-supply = <&pp4200_s5>;
>>> +             pvdd3-supply = <&pp4200_s5>;
>>> +             pvdd4-supply = <&pp4200_s5>;
>>> +
>>> +             regulators {
>>> +                     /*
>>> +                      * vbuck1 is the cpu-supply for CPU6 and CPU7.
>>> +                      *
>>> +                      * However, this device originally shipped with a broken
>>> +                      * firmware that causes register reads over SPMI fail.
>>> +                      * This is fixed in firmware version 15842.175.0, which
>>> +                      * is included in ChromeOS releases R150-16700.22.0 or
>>> +                      * R151-16721.0.0 and later.
>>> +                      *
>>> +                      * Assigning the cpu-supply properties for CPU6 and CPU7
>>> +                      * without the fix will likely cause CPU DVFS to stop
>>> +                      * working. Hence the assignment is left out to avoid a
>>> +                      * regression of the function. If the user is confident
>>> +                      * that their system has the fix, they can added the
>>
>> [Severity: Low]
>> This isn't a bug, but there is a typo in this comment. It should say
>> "they can add the property themselves".
>>
>>> +                      * property themselves.
>>> +                      */
>>
>> --
>> Sashiko AI review · https://sashiko.dev/#/patchset/20260709081928.612294-1-wenst@chromium.org?part=1

