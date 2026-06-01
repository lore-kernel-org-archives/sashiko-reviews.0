Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2A738D3F3
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304572; cv=none; b=UKkkzhNfRR7kZQIbSvgCOBGlaGzX19JaClrppo6PP2M33q45roHLKK9W38gKBhgxLUqcp9ODO1lde9VItrvIAaTxKNc/G/ysrP9HbvR3vU0dE7kYu90hXbJGhdSZhKVbmv/EIu00AUuaiJsm5MQH9HyiAtwWbob5EEvoEGsMQKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304572; c=relaxed/simple;
	bh=4dH6hzvTjnW+GZA3+yzP2/rz0qP6WSKvqY0caaPpiBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m8lWZHjGz2Jqtr6FBJLvgQnJTsbeM1nJrufibV2v41mhQUUiyXsPRW8KZ0s275Ql4XmJ2zQMtcjoF0Cq5eq537F6Xd0vl0NZWzHNqWrIBkYv89+JBdPvll2cr1zAZANFYL0Sgkr+0SfDZhTB/Y7zSbPZL7jNKGzdr+86tCXr9Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5ot2mph; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pf5GO1ZG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5ot2mph";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pf5GO1ZG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65162VUd3358415
	for <sashiko-reviews@lists.linux.dev>; Mon, 1 Jun 2026 09:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dS24bvMnimy4PR7Q5DeqliRbUmxNl+ULW60N717m0To=; b=O5ot2mph9Ii9OZ1U
	7Oe6dbxnNSnS5PZbp5A6e6S6UUl9QIEjiYDWroUKON+hT86eUuwxgbqG20BV8Akv
	b5JcP3ZNJ2+Yb/EyNDQk4WzmmAQvFkveEHj8hxzYFWpCbCsi2jw589DNiLmAbRNi
	31277feDw4wVvRuYwZ80mewh1BUJj9qzimaW2hm7z8QzfxImfXwxJAbMTxN4VFZl
	TEx88LR41kdS7Mq9aEj3HmDbil4FoBV0I46csYbc6GcljXDsO3ipIjvY5sAm0SfT
	/3u4LE/h9YbGOKuTSOG4n7Rfk62GPkRVcJzJ4iyTq8Pf9Q1Tpf4F7Y3Tl2I8fkWy
	KqEyFA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs66xhsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 09:02:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0b35fa876so17667115ad.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 02:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780304569; x=1780909369; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dS24bvMnimy4PR7Q5DeqliRbUmxNl+ULW60N717m0To=;
        b=Pf5GO1ZG5vfqc/0KkHRvVnagIwTV8AOGBvtT6RoYOewNGuzjdP+ALsBOk+RywwNIqo
         N+L2qDT/2s0FiIUe2A+LJTcK/atJjGngL8H5czB/DwNljMr8kiVs1NrhwsA7oX6dZTS0
         vFvpzHI7e5H1MONZCBov0zM0LAWS7MBQsx7PE8dpmMbbm5Ku1IfEXwddnRgpUyRUsNH7
         Uq31YB5pp3e4ht1olet9C2DcfxovNT29gZSLUjhvtmRA3DAI9Hvyfisf2zbeGskSErhR
         XSd6DlR2BpsV9T0Rft0UelEAg1xf8zbi39pkJ2nM/ueTb6fo2Oln4tkxsGX0SH2YEv3x
         aRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780304569; x=1780909369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dS24bvMnimy4PR7Q5DeqliRbUmxNl+ULW60N717m0To=;
        b=Fv1Quh4kn7AcyMUnN6DYfkeEpx0Kl4l+fIYrd0VyaqQFfnmuMbcilT+PBKn5ClgKp/
         snhNG0vDUV4FQUfyf+qFtGm+SG5/s1W5XEc3WwFMTxw4KWRQSPYwQU/N9lQOjctQZZl0
         rZgXLDlLZlNHnNMYkJcBxN3vwkbnOorgpvzBw4jx4iu9d4Khia7tFI3sFrlTKJ4K/DDq
         cwFQIsOjBGSodY2fQQ0UtAMrMeUIxN5OAisSPsC7IzwQ5HrWQMoxadLT9rSw/j2UqG65
         Pzd4gUgPkalCkq2R5BbGBKAGOZh4r8amT3o9KYso6PHl3zJLOOVRWWb71yaU2HTlQZpi
         48BA==
X-Gm-Message-State: AOJu0Yz0X0yewTc6t+pcPo4acbBHPyZtoSH6JMx9aPZFuhvm7oBfMVx/
	AB07WJvk4xNXDGjEc8HKeeoRwKZKehdeJjJimi2FSb0wZg+mWm8m6vHRpDpnLFtCRUFXq5P7Hq6
	BsJkgUJAF5vZcrbjWAtWKWBzc/fqwz6/I/3Vq80KaFwNlduXBgMUxfsuvoQJcNBwM0+uiWILaPa
	aqY/p09Eft
X-Gm-Gg: Acq92OHlwuibR2OLZBetsiu12HdJ9UgBHms+dxVDy6S+pKnXZ5eQE1CpKsLiZEf1qNl
	/t5SxaLvR0S6UIIAKC22pKnpINp1ZIefMTkqxBNtIzEt6W3QOT2j9W7MdWwuBdjsSMl4rTR9xuN
	5Efy54ySwxsKRV+J2IWS+NF+QGnEN/ygNObLZSNPoJ/m2Kt+cSIvz/U7bwCybFUjy0Fpd3s34qC
	KhYSMNN11N4/SFBbxdPOr+nYEmjZZnVIkUvSqcNYzAExmY8sDXVCjz1Ui55xOOB7wCJmDrMo4QD
	IAyrC4kLi/Ywxj7poen7lkdCEzR0AheRYyjUIkEejBUj/Q633ASftK9knwcqwpBKv1PFlK55WvW
	8wIJGO3n+RXeaUDfluEG4Kt7xpHIcB9l0WessVGUhPSm60MblJTyb7k+wPIza+xx1MJIm5a5NHW
	3Sr6M5pNtRGM2uz+IrWyX2
X-Received: by 2002:a17:903:3585:b0:2bd:ba75:81c4 with SMTP id d9443c01a7336-2bf367cbd56mr111929645ad.13.1780304569353;
        Mon, 01 Jun 2026 02:02:49 -0700 (PDT)
X-Received: by 2002:a17:903:3585:b0:2bd:ba75:81c4 with SMTP id d9443c01a7336-2bf367cbd56mr111929095ad.13.1780304568792;
        Mon, 01 Jun 2026 02:02:48 -0700 (PDT)
Received: from [10.133.33.9] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011f7sm130112305ad.41.2026.06.01.02.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 02:02:48 -0700 (PDT)
Message-ID: <e0a89628-84ef-4299-b25c-9d4d3c5c7b85@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 17:02:46 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
 <20260528030538.F0FB31F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
In-Reply-To: <20260528030538.F0FB31F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5MCBTYWx0ZWRfX1HjJfEKGtE7R
 iqkgeg6ptKlQ8jAAUlLlMsxtHMr5jcXPlyj+N0dCenwoxcHV+fotOMOgX+7Kn+8yJu8vYlo85f2
 tTUmeTf2iWo+LEgNkyVtOGqRjb89EN60rER9b8qURN1wolYAjdFpuyz4QhIr2OsFlgzSJ/sO7l6
 X3Xt2yMN0iPSEVYReq4J/1jKNnQLiAs6bJEy5mHEDBYrLhxtzLqmEYDDoWnBPLw8vJUIw9HxBZd
 ogAk3wApwF3yTMURHK1BAq5UMnMlJvrs9uQVSBDrtEIxGm+B47pMeBRImf+GXdmgfx543iGc2VV
 Wi5NpXV/g0+DNk0usJmpTjkirUfEl+oGuB0bqcWHtEvGl4HZUq3rEGuKr2wP8++aIWQ4XPLkoWY
 W/FRnoyYOlgyYswHlg75j4Y1Xb49CHk9eRxqf7oSayabBL6qK7c2E7TeRdAMHAjy2OiWAHd13HW
 Nv0pexY6eaN7htpvegw==
X-Authority-Analysis: v=2.4 cv=X8di7mTe c=1 sm=1 tr=0 ts=6a1d4aba cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RwAibasCBCaYvBehKCwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 1mJsjCsfqRyi8U1Ko42P_lXNpg8-a35p
X-Proofpoint-GUID: 1mJsjCsfqRyi8U1Ko42P_lXNpg8-a35p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010090


On 5/28/2026 11:05 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Unbalanced regulator disable during late init for clocks left enabled by the bootloader.
> - [Medium] Hardcoded resource mapping and OF provider registration prevent API reuse in multi-functional drivers.
> - [Medium] `qcom_clk_ref_is_enabled` returns a negative error code on failure, which CCF interprets as true.
> --
>
> commit 958034c0adafc3f72b4d7e46df81935d74404f7a
> Author: Qiang Yu <qiang.yu@oss.qualcomm.com>
>
> clk: qcom: Add generic clkref_en support
>
> This commit introduces a new clk_ref clock type with custom clk_ops for
> QREF blocks. It provides a common registration and probe API intended to
> be reused across different placements like TCSR and TLMM.
>
>> diff --git a/drivers/clk/qcom/clk-ref.c b/drivers/clk/qcom/clk-ref.c
>> new file mode 100644
>> index 0000000000000..213c0f58bb36e
>> --- /dev/null
>> +++ b/drivers/clk/qcom/clk-ref.c
> [ ... ]
>
>> +static void qcom_clk_ref_unprepare(struct clk_hw *hw)
>> +{
>> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
>> +
>> +	if (rclk->desc.num_regulators)
>> +		regulator_bulk_disable(rclk->desc.num_regulators, rclk->regulators);
>> +}
> [Severity: High]
> If the bootloader leaves this clock enabled, the common clock framework
> will call unprepare() during late init to turn off unused clocks. Since
> prepare() was never called by the kernel, won't this
> regulator_bulk_disable() call trigger an unbalanced disable warning and
> permanently leak power?
>
> Does the driver need to sync the hardware state during probe by enabling
> the regulators if the clock is already on?
clk_unprepare_unused_subtree() calls unprepare() only when
clk_core_is_prepared() returns true. Since our driver has no .is_prepared
op, the framework falls back to checking core->prepare_count, which is 0
if the kernel never called prepare(). So unprepare() will not be called in
that path, and the regulator imbalance you describe cannot happen via the
unused clock cleanup.

- Qiang Yu
>
> [ ... ]
>
>> +static int qcom_clk_ref_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
>> +	u32 val;
>> +	int ret;
>> +
>> +	ret = regmap_read(rclk->regmap, rclk->desc.offset, &val);
>> +	if (ret)
>> +		return ret;
> [Severity: Medium]
> If regmap_read() fails, this returns a negative error code (e.g., -EINVAL).
> Since the common clock framework evaluates the is_enabled callback as a
> boolean, won't it treat this negative error code as true and incorrectly
> assume the clock is enabled?
>
>> +
>> +	return !!(val & QCOM_CLK_REF_EN_MASK);
>> +}
> [ ... ]
>
>> +int qcom_clk_ref_probe(struct platform_device *pdev,
>> +		       const struct regmap_config *config,
>> +		       const struct qcom_clk_ref_desc *descs,
>> +		       size_t num_clk_refs)
>> +{
>> +	struct qcom_clk_ref_provider *provider;
>> +	struct device *dev = &pdev->dev;
>> +	struct regmap *regmap;
>> +	void __iomem *base;
>> +	int ret;
>> +
>> +	base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(base))
>> +		return PTR_ERR(base);
> [Severity: Medium]
> The commit message mentions reusing this model for blocks like TLMM on SM8750.
> If a multi-functional driver like TLMM tries to use this helper, won't
> devm_platform_ioremap_resource() fail with -EBUSY because the parent driver
> already maps the register region?
>
> Since qcom_clk_ref_register() is static and callers are forced to use
> qcom_clk_ref_probe(), does this hardcoded resource mapping prevent the
> intended integration with multi-functional drivers?
>
