Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8243101C0;
	Wed, 22 Jul 2026 14:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730747; cv=none; b=RnT8Eym1EIy7fZ98BgWTAddkkS5jLx2zMSuyNFUwmZRi6d2i0XbkMOtwQY1TMKxuiKc/17r4OT0i45BPa/C7tj/cp0C1HzbTCHkQu43K1svZlmfX9iWV2tYC59+5Ska5H0AMpayGKkEmKx43gQ7G+Diy6zv3NZELPpwSHN+jxU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730747; c=relaxed/simple;
	bh=hBd/4lm7LbdwVpnM+/uAlh8ONdCd2N7HS6w7pj+XSkI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qEjfVl2vtskzrx2lt8/Fen+NmIiXfCT92wvWJXXU2L27aaDzRm5aGLAtA8Sfy8DFrDZgm33JDK6MLdnx9vmLp1cHZZPHyAATWmOFtceyD4M0cv5pwgMM9JM55IDK+l3iKphqtQ55lhtCR0/0Ima3vF3Om4z3FZLjYl8iBLczbT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VVPm48ge; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VVPm48ge"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FA21F000E9;
	Wed, 22 Jul 2026 14:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784730746;
	bh=I8uryKb2LrpWj94ZKPp80W37fLy+qsE5kicLbkv3wQ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=VVPm48gebjO9VXGd9O4Vpxg/lVVih9SatOhCj+j9R5Ejpne9Di3+/sUzitaA0Rl8v
	 bnl85Eqa7eLpWZZihT1NIspc3QTJ1avfjL4HZdkHTplxLn9OK1w9e6HvFO/6oIo8F1
	 NaOgUpcxH0P76J66qqwZ83JOsIyciLzSaVppfPeFtM/7MsQNAsiSOVqEVgB1qqBsDY
	 DneEnhhZbF8+7/ir2zWXdDruEnrMG91cE6k6TA5keTL2HkdC19lldgbWP9HN7je+B/
	 BIBwnU85pPfMHC60z1/GmlSrn2PzR8gpCAPfSBlslRAidIEfspzqJHdO9Hb/xz3MEK
	 YOvUW8qNOoB8Q==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: sashiko-reviews@lists.linux.dev, Mattijs Korpershoek
 <mkorpershoek@kernel.org>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com,
 robh@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] phy: qcom: qmp-usb: Add support for SA8255P
In-Reply-To: <20260722140157.619571F000E9@smtp.kernel.org>
References: <20260722-phy-qcom-qmp-usb-8255-v3-0-e789070b48f7@kernel.org>
 <20260722-phy-qcom-qmp-usb-8255-v3-2-e789070b48f7@kernel.org>
 <20260722140157.619571F000E9@smtp.kernel.org>
Date: Wed, 22 Jul 2026 16:32:23 +0200
Message-ID: <875x27hz7s.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 14:01, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Incorrect power domain sequencing in `d3_to_d0` and `d0_to_d3` t=
ransitions, violating hardware constraints.
>
> Pre-existing issues:
> - [High] Unbalanced clock prepare/enable and disable/unprepare, leading t=
o `pipe_clk` enable count leak.
> --
>
> --- Patch [2]: [PATCH v3 2/2] phy: qcom: qmp-usb: Add support for SA8255P=
 ---
> commit 2b06432a4f84c161e8379370587f792f91bca968
> Author: Sriram Dash <quic_sriramd@quicinc.com>
> Subject: phy: qcom: qmp-usb: Add support for SA8255P
>
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> This commit adds support for the SA8255p SoC in the QMP USB driver by
> using SCMI power protocols to manage platform resources via runtime PM
> framework APIs. Two sets of resources are modeled as "core" and "transfer"
> power domain suppliers.
>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualc=
omm/phy-qcom-qmp-usb.c
>> index c5507168e1354..881f4ce23241e 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> [ ... ]
>> @@ -1865,6 +1890,77 @@ static const struct qmp_phy_cfg glymur_usb3_uniph=
y_cfg =3D {
>>  	.regs			=3D qmp_v7_usb3phy_regs_layout,
>>  };
>>=20=20
>> +static int qmp_usb_domain_attach(struct qmp_usb *qmp)
>> +{
>> +	struct dev_pm_domain_attach_data pd_data =3D {
>> +		.pd_flags       =3D PD_FLAG_NO_DEV_LINK,
>> +		.pd_names       =3D (const char *[]) { "transfer", "core" },
>> +		.num_pd_names   =3D 2,
>> +	};
> [ ... ]
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
>
> [Severity: High]
> Does resuming the 'transfer' domain before the 'core' domain cause hardwa=
re
> bus hangs?
>
> The commit message states that the "core" domain controls the GDSC (power=
),
> while the "transfer" domain controls clocks. It appears this sequence tur=
ns
> on the clocks before enabling power to the logic.

I have not observed any issues during my testing on a SA8775p board with
SCMI firmware (that's compatible with this driver)

>
>> +	if (ret)
>> +		pm_runtime_put_sync(qmp->pd_list->pd_devs[0]);
>> +
>> +	return ret;
>> +}
>> +
>> +/* d0_to_d3 transition by turning off all the suppliers */
>> +static void qmp_usb_d0_to_d3(struct qmp_usb *qmp)
>> +{
>> +	if (!qmp->pd_list)
>> +		return;
>> +
>> +	pm_runtime_put_sync(qmp->pd_list->pd_devs[1]);
>> +	pm_runtime_put_sync(qmp->pd_list->pd_devs[0]);
>
> [Severity: High]
> Similarly, does suspending the 'core' domain before the 'transfer' domain
> cause issues?
>
> This sequence disables the GDSC (power) before disabling the clocks, which
> might also violate hardware constraints and lead to timeouts or freezes.

I have not observed any issues during my testing on a SA8775p board with
SCMI firmware (that's compatible with this driver)

>
>> +}
> [ ... ]
>> @@ -2126,14 +2234,23 @@ static int __maybe_unused qmp_usb_runtime_resume=
(struct device *dev)
>>  		return 0;
>>  	}
>
> [Severity: High]
> This is a pre-existing issue, but does this early bailout lead to a pipe_=
clk
> enable count leak?
>
> The code right above this addition in qmp_usb_runtime_resume() is:
>
> 	if (!qmp->phy->init_count) {
> 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
> 		return 0;
> 	}
>
> During the standard PHY lifecycle, this check appears to cause an unbalan=
ced
> clock prepare/enable and disable/unprepare state:
>
> 1. phy_init() starts with init_count =3D=3D 0, so qmp_usb_runtime_resume(=
) skips
>    enabling clocks.
> 2. After phy_init() completes, init_count is 1, so phy_pm_runtime_put() c=
auses
>    qmp_usb_runtime_suspend() to disable pipe_clk, triggering a clock fram=
ework
>    underflow warning since it was never enabled.
> 3. Conversely, during phy_exit(), init_count is 1, so qmp_usb_runtime_res=
ume()
>    enables pipe_clk. Then qmp_usb_exit() decrements init_count to 0.
> 4. Finally, phy_pm_runtime_put() triggers qmp_usb_runtime_suspend() (which
>    has a similar bailout check), leaving pipe_clk permanently enabled and
>    preventing the system from hitting deep sleep states.
>
> Can this state tracking be fixed to ensure the clocks are properly matched
> during suspend and resume?

This is unrelated to the patch I've submitted. Should this be send out
as a seperate fix?

>
>>=20=20
>> +	ret =3D qmp_usb_d1_to_d0(qmp);
>> +	if (ret < 0) {
>> +		dev_err(qmp->dev, "Failed to transition to d0 state\n");
>> +		return ret;
>> +	}
>> +
>>  	ret =3D clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
>> -	if (ret)
>> +	if (ret) {
>> +		qmp_usb_d0_to_d1(qmp);
>>  		return ret;
>> +	}
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-phy-qcom=
-qmp-usb-8255-v3-0-e789070b48f7@kernel.org?part=3D2
