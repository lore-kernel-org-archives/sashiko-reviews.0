Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186635;
	b=BPDT+QzqTd6foQSTuYH5xEmOV4B4JquBCw6XiQK4fzFwksk9VvTz0dzoLZDE2kcLPyHI
	 atuQ8jOQwnOhmWfMbcWkZ47YkFu1eWwi80YZn+NQrEFw5lWdMIbsQBjeBhtmI3XNmH55D
	 YhzY3mgapAglEUfFv6Zg6NxtArci/F0Vu6pvnbAT4cuebMMDTbBGs3VaAQMK57AmGwQ9w
	 ZjdJIqdKDrYNXRH7Jt3aB5fxcV/0dNHXycv1i7EalUW8sND7yqOmrXK4+QI/YIIk6LYPK
	 BgPOwVCrZhRZBp1KntMcsN0BpEUQoZZklE2VddAZ+ZvL1MGi3Pxn8Jmnuc5HG4CqHuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186635;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=VigvJCRt5rXY+6Kai55nHb34XII7DZnlFQiPz+X14Z4=;
	b=kDshSNLlnzabEPcQZHqkAYJEtxQw6ABMtxxrt35cZwntTEx3uH5cAKKXyH4dOYh7rFzq
	 EuGDy1x3YqikYTXF0tP1tmcajkcBPoicdOwmhUHwAmYr+Z8rNngbardIHpP34nClHKh1z
	 0kjJUDCRlOKSaQzRyfMjMss1e/BpbT523R14xA7DfH0j2LtxNEnMP30OJDMkx2uXcERUg
	 L1aezBLl+TDI+5GCcaFryibrmFshQeqVm8dI3gUi7s1wvXst/h3vQp2qcUcZ4zu4ZKPNq
	 yXU+04OueNNka8K5Yk0lBnL+6MsO0aMIWox1VSGgV+79IFLmXWuSCi/jPZ9AEn2wLJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IWGA7uvu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1A1606A32C;
	Fri, 20 Nov 2026 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IWGA7uvu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B98C1F000C6;
	Fri, 20 Nov 2026 14:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186634;
	bh=VigvJCRt5rXY+6Kai55nHb34XII7DZnlFQiPz+X14Z4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=IWGA7uvu2MNG1+rvnP6DxMwptyVI8Pkgsj7+Sezxf/GivzfH5F6TV+kJ0Uh4Grg5D
	 m+Jf6nY7EKL/Ew9z/r7JgMb6+renWFEObbdwkmT6Crn+PdBvAzhnzh9GuaXB/u7yRX
	 +xxTsjiW9bKxm9pXEYOIA5dizN9RlIecuBq00HfiqxsQowP+ZpDSjeYskl3ncXnwll
	 5alPiJAejp3VcEbqdrhC/ED1O/H4HpjNp6Qwm1Ig8HVhTLdSVn7WiLtfUJLeCON1wn
	 gvxFL04fVGIO7+vxD67QCUJMNe0zu2j1VZFMjcnCDjdTANnwCByyBZxxDWFLO/IuXB
	 2s4qYPrfa1ulw==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
 neil.armstrong@linaro.org, olteanv@gmail.com
Subject: Re: [PATCH v5 2/2] phy: qcom-snps-femto-v2: Add support for SA8255P
In-Reply-To: <sashiko-outbox-225334@kernel.org>
References: <20261120-phy-qcom-snps-femto-v2-8255-v5-0-86a9880ee5a5@kernel.org>
 <20261120-phy-qcom-snps-femto-v2-8255-v5-2-86a9880ee5a5@kernel.org>
 <sashiko-outbox-225334@kernel.org>
Date: Fri, 20 Nov 2026 15:57:12 +0100
Message-ID: <xhkdbcxrzpn3r.fsf@mkorpers-koolstof.csb>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 14:11, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] phy: qcom-snps-femto-v2: use devm_pm_domain_attach_list() and
>   check ret =3D=3D 0
> --
>
> commit 40323ed83ee6f03c36d2767d1e91cd08ccff373b
> Author: Sriram Dash <quic_sriramd@quicinc.com>
>
> phy: qcom-snps-femto-v2: Add support for SA8255P
>
> This commit adds support for the SA8255P USB HS PHY variant, whose power,
> clock, and reset resources are managed by SCMI firmware through "core" and
> "transfer" power domains.
>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy=
/qualcomm/phy-qcom-snps-femto-v2.c
>> index 0dae8369671ab..0ec34bc5c26ec 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> [ ... ]
>> @@ -164,8 +167,82 @@ struct qcom_snps_hsphy {
>>  	bool phy_initialized;
>>  	enum phy_mode mode;
>>  	struct phy_override_seq update_seq_cfg[NUM_HSPHY_TUNING_PARAMS];
>> +
>> +	struct dev_pm_domain_list *pd_list;
>>  };
>>=20=20
>> +static void qcom_snps_domain_detach(void *data)
>> +{
>> +	struct qcom_snps_hsphy *hsphy =3D data;
>> +
>> +	dev_pm_domain_detach_list(hsphy->pd_list);
>> +}
>> +
>> +static int qcom_snps_domain_attach(struct qcom_snps_hsphy *hsphy)
>> +{
>> +	struct dev_pm_domain_attach_data pd_data =3D {
>> +		.pd_flags       =3D PD_FLAG_NO_DEV_LINK,
>> +		.pd_names       =3D (const char*[]) { "core", "transfer" },
>> +		.num_pd_names   =3D 2,
>> +	};
>> +	struct device *dev =3D hsphy->dev;
>> +	int ret;
>> +
>> +	ret =3D dev_pm_domain_attach_list(dev, &pd_data, &hsphy->pd_list);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "domain attach failed\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static bool qcom_snps_is_fw_managed(struct qcom_snps_hsphy *hsphy)
>> +{
>> +	return hsphy->pd_list !=3D NULL;
>> +}
>> +
>> +static int qcom_snps_pds_enable_all(struct qcom_snps_hsphy *hsphy)
>> +{
>> +	int ret;
>> +
>> +	if (!qcom_snps_is_fw_managed(hsphy))
>> +		return 0;
>
> [Severity: Low]
> Can qcom_snps_domain_attach() succeed with hsphy->pd_list left NULL when
> dev_pm_domain_attach_list() returns 0 (for example, when CONFIG_PM is
> disabled)?
>
> If that happens, qcom_snps_pds_enable_all() returns 0 without enabling the
> power domains, and qcom_snps_hsphy_fw_managed_init() proceeds to
> qcom_snps_hsphy_configure() and writes PHY registers while clocks, resets,
> and power domains are off.  Also, qcom_snps_domain_attach() and
> qcom_snps_domain_detach() with devm_add_action_or_reset() in
> qcom_snps_hsphy_probe() duplicate devm_pm_domain_attach_list(); calling
> devm_pm_domain_attach_list() directly and returning -ENODEV when ret =3D=
=3D 0
> would avoid both issues.

While I agree this can indeed happen, having a kernel on an SCMI-enabled
board such as SA8255P does not make a lot of sense. I think that other
things will break as well. If it's not strictly necessary I'd like to
avoid resending a v6 just to fix this.

Vinod, can you please let me know if I should respin to address this?

>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-phy-qcom=
-snps-femto-v2-8255-v5-0-86a9880ee5a5@kernel.org?part=3D2
