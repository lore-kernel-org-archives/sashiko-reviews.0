Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C44136D51F;
	Wed, 22 Jul 2026 12:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722235; cv=none; b=cYiQGEM37mLPpOonlI0ItNy2kd71BEy6iGIgkSQZLweMIDxEVBmDHRqiXEQ8h+UJ0wwyQxS2L/VQ2hkOF5BV/uUWcJCtgJ018VZJnPLZ70bIsnePxbqUL5BtUFxDVLqC5qH72hc1BHJdvhvT/p+VJhqKyW1uccp7wg7XTC46lqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722235; c=relaxed/simple;
	bh=4YHXgXYZtCZ25qiPtk9KT8lQ8+H3tNr5u7aXspfGqrY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aSNSm6cNjAqoJ3CQ12l8CdjWMdTXI563Krqlki0QHXrTkBsl59vn2X7U4x3QeNYo6G4/qD67y4TUUE02flchIzoMpBQ19qjjlzgPyu9Z3q9NDB8SN5JUpxCya4020cNh6NyaKE/bE/Hve97O5RnSqswC3hGzOckvkt9OmSfQMTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/RG+UTK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/RG+UTK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2E81F000E9;
	Wed, 22 Jul 2026 12:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784722233;
	bh=fIe0wUrrDVszjvm6kkoTVaoHwx2WuyyXexPYM+RlgpQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=e/RG+UTKXTiJg+Z+keGVwljTspAcEtzFRMAmoOOR1Bec2THmY/Ooo9kmfHZJdQq4F
	 slqd3LzpyCs7oQgY9vr9CMWFLYQmbikHC0rinNm0vivvL0nBiRmYm2DDIao1pIbMDw
	 1UnUM3KcEfObN/Qogmn+FGKjFHxmEMqTuh8nQ4dfLc9UzpCGNsC70UwtQsSl56jlTQ
	 o0Is8XpHKxdEfThynIYySlFh2tZywG/F2Us045oqJVJ5CUDc0t7G/3yIzQ0Iu2JQNm
	 geet6TTwSEmaRyNZ1tKel7V428LF6hjcqOb2n3VRzKOCEJY9z/PL9oUd9pviTRNDA9
	 yft0e6FRLxgJg==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org,
 olteanv@gmail.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, vkoul@kernel.org
Subject: Re: [PATCH v2 2/2] phy: qcom: qmp-usb: Add support for SA8255P
In-Reply-To: <20260709150659.6E0301F000E9@smtp.kernel.org>
References: <20260709-phy-qcom-qmp-usb-8255-v2-0-3b6c26a45788@kernel.org>
 <20260709-phy-qcom-qmp-usb-8255-v2-2-3b6c26a45788@kernel.org>
 <20260709150659.6E0301F000E9@smtp.kernel.org>
Date: Wed, 22 Jul 2026 14:10:31 +0200
Message-ID: <87bjbzi5s8.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2026 at 15:06, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Incorrect power domain sequencing during d0/d3 transitions risks=
 NoC errors and bus hangs.
> --
>
> --- Patch [2]: [PATCH v2 2/2] phy: qcom: qmp-usb: Add support for SA8255P=
 ---
> commit c32bbfd817c3f9fca4d2982ea37be36354501cc7
> Author: Sriram Dash <quic_sriramd@quicinc.com>
> Subject: phy: qcom: qmp-usb: Add support for SA8255P
>
> This commit adds support for the SA8255P SoC to the QMP USB PHY driver.=20
> It introduces firmware-managed resources via SCMI using power protocols,
> managing state transitions (d0, d1, d3) through the "usb_core" and
> "usb_transfer" power domains.
>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualc=
omm/phy-qcom-qmp-usb.c
>> index c5507168e1354..d085c1ad7fb5c 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
>
> [ ... ]
>
>> @@ -1865,6 +1890,77 @@ static const struct qmp_phy_cfg glymur_usb3_uniph=
y_cfg =3D {
>>  	.regs			=3D qmp_v7_usb3phy_regs_layout,
>>  };
>
> [ ... ]
>
>> +/* d3_to_d0 transition by turning on all the suppliers */
>> +static int qmp_usb_d3_to_d0(struct qmp_usb *qmp)
>> +{
>> +	int ret;
>> +
>> +	if (!qmp->pd_list)
>> +		return 0;
>> +
>> +	ret =3D pm_runtime_resume_and_get(qmp->pd_list->pd_devs[0]);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D pm_runtime_resume_and_get(qmp->pd_list->pd_devs[1]);
>> +	if (ret)
>> +		pm_runtime_put_sync(qmp->pd_list->pd_devs[0]);
>> +
>> +	return ret;
>> +}
>
> [Severity: High]
> Does this sequence power up the domains in the wrong order?
>
> The commit message notes that "usb_core" (which maps to pd_devs[1] based =
on=20
> the qmp_usb_domain_attach order) controls the GDSC, while "usb_transfer"=
=20
> (pd_devs[0]) controls clocks and interconnects.
>
> Enabling clocks before the GDSC foundational power domain is enabled typi=
cally
> results in unpowered register access on Qualcomm SoCs, which could trigge=
r a
> Network-on-Chip (NoC) error and bus hang. Should pd_devs[1] be resumed be=
fore
> pd_devs[0]?

I did not observe any bus errors during my testing. I tried to
insert/remove the phy driver and also could detect a flash drive using a
couple of more patches on other USB drivers.

So I'll keep it this way for v3.

>
>> +
>> +/* d0_to_d3 transition by turning off all the suppliers */
>> +static void qmp_usb_d0_to_d3(struct qmp_usb *qmp)
>> +{
>> +	if (!qmp->pd_list)
>> +		return;
>> +
>> +	pm_runtime_put_sync(qmp->pd_list->pd_devs[1]);
>> +	pm_runtime_put_sync(qmp->pd_list->pd_devs[0]);
>> +}
>
> [Severity: High]
> Similarly, could this cause a bus hang during the d0 to d3 transition?
>
> Putting "usb_core" (pd_devs[1]) before "usb_transfer" (pd_devs[0]) disabl=
es=20
> the GDSC before the clocks. Shouldn't the GDSC be disabled last to preven=
t=20
> unpowered hardware clock access?

When running modprobe -r, I did not observe any bus hang on my board.
I'll keep this way for v3.

>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-phy-qcom=
-qmp-usb-8255-v2-0-3b6c26a45788@kernel.org?part=3D2
