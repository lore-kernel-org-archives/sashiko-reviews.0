Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246171A9B58;
	Thu,  9 Jul 2026 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602020; cv=none; b=PxaWHzY8kA4P2RiXEJwhtfjlluIJg+nNJaBe6mcDNJPdtG6aVt0RePg/Qpu6h4orvmXCWtsyw5kjMkwDgFFMuCiGOmM1+vcVewx2XCGBfoLHyB4D4nzx1v+heWAjfHNI71RczBMhdlbxLBxDS93WQn+jh6ke0l62xfNGZZGOieY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602020; c=relaxed/simple;
	bh=jYNICqcSdZDPCxaFN0Kx5xworCc1cs8f114A+PE3pH8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=it8sx0QmoT0xuhga6djpiFebPnheHxLmjoc5vM5RQNPXgEUTMYjZ3me6NTVjVbEgfWltmMc7i+iu9SCNy+ohsD8BvmGLt7+7zNiBav8gH4Q0vcTCr0T7OPYo8fSByDydR6FSv2oiFa+8vgTGRZP2yig3wN7hUE2hhkxakIK/lKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJrJwx6h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJrJwx6h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BF11F000E9;
	Thu,  9 Jul 2026 13:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783602018;
	bh=cdGK6bbw7pzAK2kABSDnHKy3D6QQE++VD2qiKdt6Tf0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gJrJwx6h6mC3P6r3vk0uQcvGWk/r2FnziFWM68WR8WFpXa/L8AWvv36wiq8/c8fs0
	 yTIYZBy55yk3U0tk48iovTsyKFMTCcQYyAPJmqT3gkp6sEfoLtEuqtdAUZSvrK14d7
	 wRZoEMT0KTTbCSHwyJcRFr+RPmig1AtygWEazIBx3HRmA8yFQMFZ6z/BWZce0BDnCT
	 wfVGizkrWakvS3D0JEz/Og8wEk7R+w6GIKnM9fLxaDCKzsZWab0GJkrPRPvZLM/wNm
	 NBBxUsKMGk/yxh+7ErAubVDmbiHXiamiPgrJE6u2uajQKPStRf/pO+6CTv5I0Sqhbj
	 nrcp8Vfg73V2A==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: olteanv@gmail.com, devicetree@vger.kernel.org, robh@kernel.org,
 linux-phy@lists.infradead.org, vkoul@kernel.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-usb: Add support for SA8255P
In-Reply-To: <20260708131123.3F29B1F00A3A@smtp.kernel.org>
References: <20260708-phy-qcom-qmp-usb-8255-v1-0-8d852a9535db@kernel.org>
 <20260708-phy-qcom-qmp-usb-8255-v1-2-8d852a9535db@kernel.org>
 <20260708131123.3F29B1F00A3A@smtp.kernel.org>
Date: Thu, 09 Jul 2026 15:00:15 +0200
Message-ID: <87bjcgl3mo.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2026 at 13:11, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The driver leaks runtime PM usage counters for its manually mana=
ged power domains ('usb_transfer' and 'usb_core') on multiple error paths, =
leaving hardware permanently active and risking usage counter overflow.
> - [High] Teardown operations disable PM domains before disabling leaf con=
sumer clocks and asserting resets, violating strict reverse-initialization =
ordering and risking hardware access faults.
> --
>
> --- Patch [2]: [PATCH 2/2] phy: qcom: qmp-usb: Add support for SA8255P ---
> commit 487667fe3c076bbe0851ee1739a5d0f2311634d9
> Author: Sriram Dash <quic_sriramd@quicinc.com>
> Subject: phy: qcom: qmp-usb: Add support for SA8255P
>
> This commit adds support for the SA8255P SoC to the QMP USB PHY driver.
> It introduces firmware-managed power domains that are controlled via
> runtime PM APIs during the driver's power state transitions.
>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualc=
omm/phy-qcom-qmp-usb.c
>> index c5507168e1354..2ac6a23868bf9 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> [ ... ]
>> @@ -1890,6 +1890,77 @@ static const struct qmp_phy_cfg glymur_usb3_uniph=
y_cfg =3D {
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
>> +
>> +	return ret;
>
> [Severity: High]
> If the resume of pd_devs[1] fails here, will this leak the runtime PM usa=
ge
> counter for pd_devs[0]? Should there be a pm_runtime_put_sync() for
> pd_devs[0] before returning the error?

Indeed. Will fix in v2.

>
>> +}
>> +
>> +/* d0_to_d3 transition by turning off all the suppliers */
>> +static void qmp_usb_d0_to_d3(struct qmp_usb *qmp)
>> +{
>> +	if (!qmp->pd_list)
>> +		return;
>> +
>> +	pm_runtime_put_sync(qmp->pd_list->pd_devs[0]);
>> +	pm_runtime_put_sync(qmp->pd_list->pd_devs[1]);
>
> [Severity: High]
> Since qmp_usb_d3_to_d0() enables these domains in the order 0 then 1,
> should this disable them in the reverse order (1 then 0)?

Indeed. Will fix in v2.

>
>> +}
> [ ... ]
>> @@ -1980,6 +1980,12 @@ static int qmp_usb_init(struct phy *phy)
>>  	void __iomem *pcs =3D qmp->pcs;
>>  	int ret;
>>=20=20
>> +	ret =3D qmp_usb_d3_to_d0(qmp);
>> +	if (ret < 0) {
>> +		dev_err(qmp->dev, "Failed to transition to d0 state\n");
>> +		return ret;
>> +	}
>> +
>>  	ret =3D regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>>  	if (ret) {
>>  		dev_err(qmp->dev, "failed to enable regulators, err=3D%d\n", ret);
>>  		return ret;
>
> [Severity: High]
> If regulator_bulk_enable() fails, this returns directly. Does this leave
> the PM domains enabled, leaking their usage counters since qmp_usb_d0_to_=
d3()
> is not called to balance the earlier qmp_usb_d3_to_d0() call?

Indeed. Will fix in v2.

>
>> @@ -2025,6 +2025,8 @@ static int qmp_usb_exit(struct phy *phy)
>>  	struct qmp_usb *qmp =3D phy_get_drvdata(phy);
>>  	const struct qmp_phy_cfg *cfg =3D qmp->cfg;
>>=20=20
>> +	qmp_usb_d0_to_d3(qmp);
>> +
>>  	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
>>=20=20
>>  	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>
> [Severity: High]
> This disables the power domains via qmp_usb_d0_to_d3() before disabling
> the leaf clocks and asserting the resets. Can this sequence cause
> unclocked or unpowered register accesses and trigger hardware faults?
> Should the domains be disabled at the end of the teardown instead?

No because resets and clocks are not used in the firmware-managed mode.
But for consistency, I will move qmp_usb_d0_to_d3() at the end of
qmp_usb_exit() in v2.

>
>> @@ -2212,6 +2212,8 @@ static int __maybe_unused qmp_usb_runtime_suspend(=
struct device *dev)
>>=20=20
>>  	qmp_usb_enable_autonomous_mode(qmp);
>>=20=20
>> +	qmp_usb_d0_to_d1(qmp);
>> +
>>  	clk_disable_unprepare(qmp->pipe_clk);
>>  	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>
> [Severity: High]
> Similar to the exit path, this powers off the transfer domain before
> the clocks are disabled. Could this cause bus errors when the clocks are
> manipulated?

Will move after clk_bulk_disable() in v2.

>
>> @@ -2232,6 +2232,12 @@ static int __maybe_unused qmp_usb_runtime_resume(=
struct device *dev)
>>  		return 0;
>>  	}
>>=20=20
>> +	ret =3D qmp_usb_d1_to_d0(qmp);
>> +	if (ret < 0) {
>> +		dev_err(qmp->dev, "Failed to transition to d0 state\n");
>> +		return ret;
>> +	}
>> +
>>  	ret =3D clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
>>  	if (ret)
>>  		return ret;
>
> [Severity: High]
> If clk_bulk_prepare_enable() fails, the function returns ret without
> undoing qmp_usb_d1_to_d0(). Will this leak the transfer domain's PM usage
> counter?

Indeed, will fix in v2.

>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-phy-qcom=
-qmp-usb-8255-v1-0-8d852a9535db@kernel.org?part=3D2
