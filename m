Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25AF3C4563
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 03:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778814146; cv=pass; b=KFVpo+MqzhQm7Hadm8OUMGJdeM9OrSZLe8ayVFonFsmflzMhhapFr4foG0V1joFEq7ft1HjY03PzR/uAwXygZp/KWzLegH8pH27/FWhewDi5wo+WqpFvLepLFaacOU4894YuNLQlx8r84eUPGVROZJBQSAFQCeSGuI8E6YlSKZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778814146; c=relaxed/simple;
	bh=dyZPgBChY99/iHmj5U84EX4BMYoVSMr/fTUqGlpI7W0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=tsOdRNoqMjHmYmRpS8FNyMyNUaca+XLsBN/Q9oaEOQmTN6sL2+3SZsE1CfdRPLL1vVPr/w3fG2G0O+TeHLIvp3KPZOqTTNTaC1akVRFYM+EfxDzSeRH1QPFSulQvo9ct9QeTTTlfY+mJ9qULV+nzx1De9WJBUjSUTMFARhVwu0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=fZrGnatE; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="fZrGnatE"
ARC-Seal: i=1; a=rsa-sha256; t=1778814139; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZTLTOCH4QACSXPm/P88s4FOBywNqYthsnUmG66Yee9pyvVKb5yryAGEh3TlYQnfZ4oj2qNdbCREmSMpKBZ4dkJomyFu7hB9+NQ4ODnWnAeaCRmDTrJIfyF4HWnzCdnd5XfSTp3odyMxrzpxpBYjGGEJCJIKVRVDa1QefwpTNcZw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778814139; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4n/XbRYHd8XjsRnvVLMKpN1WjkZh8ld26QymEgYHYCs=; 
	b=Pg9zcRYE3O4pPXpmNRZMZplFCCWtYboe8zFFcy3WPxKVCfwiU8jYKss5fgbRaMEMKzcMR9MnYg0EzKsCGf97URNQgI6oZkl6Lf1ao20h5hwp5i+LcMHTqQ23MnGyV6vkMM05fVhLlI0jYwKrFEN6LxeDyg7Uz8mUyTcK2ZO/EyM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778814139;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=4n/XbRYHd8XjsRnvVLMKpN1WjkZh8ld26QymEgYHYCs=;
	b=fZrGnatEzkN0URENlgy7OXWU7yxHC1V4zAnXsribU0xnIW4wwl3Njlmw4gh8eFy4
	/+e9WO9GRrsEsDZM2be5mryE2Z6G5nuChmS3WIEil94h0ejCttRnHimezcJ4HP2eebX
	wfs7RGtCZIy3xmrTZYjojB82cjtU10vSwf55qOx0=
Received: by mx.zohomail.com with SMTPS id 1778814137416850.1047948154467;
	Thu, 14 May 2026 20:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 May 2026 11:02:06 +0800
Message-Id: <DIIWZC9OQLDW.E3I75VVPJ09T@pigmoral.tech>
Cc: <krzk+dt@kernel.org>, <devicetree@vger.kernel.org>, <robh@kernel.org>,
 <conor+dt@kernel.org>
Subject: Re: [PATCH v5 5/6] riscv: dts: anlogic: add clocks and CRU for
 DR1V90
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: <sashiko-reviews@lists.linux.dev>, "Junhui Liu"
 <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.21.0
References: <20260514-dr1v90-cru-v5-5-34f3021aab51@pigmoral.tech>
 <20260514194815.3483CC2BCB3@smtp.kernel.org>
In-Reply-To: <20260514194815.3483CC2BCB3@smtp.kernel.org>
X-ZohoMailClient: External

On Fri May 15, 2026 at 3:48 AM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The `can_ext` and `wdt_ext` fixed-clock nodes are missing the ma=
ndatory `clock-frequency` property.
> --
>
> commit 2b9cd6d4a55b4608470fd48bd92b6cacba368046
> Author: Junhui Liu <junhui.liu@pigmoral.tech>
>
> riscv: dts: anlogic: add clocks and CRU for DR1V90
>
> This commit adds clocks and introduces the Clock and Reset unit node
> for the Anlogic DR1V90 SoC. It configures a main crystal oscillator
> and two optional external clocks for the CAN and WDT modules.
>
>> diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/d=
ts/anlogic/dr1v90.dtsi
>> index 9fe183f5f5c8d..574c6608aef01 100644
>> --- a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
>> +++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
>
> [ ... ]
>
>> @@ -40,6 +43,26 @@ cpu0_intc: interrupt-controller {
>>  		};
>>  	};
>> =20
>> +	clocks {
>> +		can_ext: clock-ext-can {
>> +			compatible =3D "fixed-clock";
>> +			clock-output-names =3D "can_ext";
>> +			#clock-cells =3D <0>;
>> +		};
>> +
>> +		osc: clock-osc {
>> +			compatible =3D "fixed-clock";
>> +			clock-output-names =3D "osc";
>> +			#clock-cells =3D <0>;
>> +		};
>> +
>> +		wdt_ext: clock-ext-wdt {
>> +			compatible =3D "fixed-clock";
>> +			clock-output-names =3D "wdt_ext";
>> +			#clock-cells =3D <0>;
>> +		};
>
> Are the can_ext and wdt_ext fixed-clock nodes missing the mandatory
> clock-frequency property?
>
> The fixed-clock devicetree binding requires a clock-frequency property.
> Without it, the fixed-clock driver fails to read the frequency and return=
s
> -EIO during both of_fixed_clk_setup and platform probe, failing to regist=
er
> the clock providers.
>
> Because the cru node specifies these clocks as suppliers, the kernel's
> fw_devlink mechanism will indefinitely block the CRU driver from probing.
>
> This recursively blocks all CRU consumers, including the UART console,
> leaving the system without a working console.
>
> Would it be better to add a dummy frequency, mark these nodes with
> status =3D "disabled" in the dtsi, or define them only at the board level
> when they are actually present?

Yes, this is true.

I will update the binding to make both can_ext and wdt_ext optional, and
remove them from the SoC dtsi. If a specific board uses these external
clock inputs, the board-level dts can define them with their actual clock
frequencies.

>
>> +	};

--=20
Best regards,
Junhui Liu

