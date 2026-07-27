Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD81413E41A
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 04:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785127555; cv=none; b=s+pFlFa7ey1fRMETD1jFPADz48AwbuDOeKs+w1Pl6xahi60cDx2D1IYjJlaBcAE3Z9y+deZCeWJWq09/6DDY/SNcwzbvkiwxlK/Xz5gIFIkzEF9zfFwqAFMgePttWeeoSJ7ea8YQMQ+YfsOriCLzyj1aIQ7QRDEHbS522E9JAzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785127555; c=relaxed/simple;
	bh=47D78e4QW/R5ulGRGapsQVcMs6w5CoLA4+pkNYFpAlg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Br4wlKnHptFBvex6c4HVCr5gPcXzTD+dX+SgQf0byTuNW316AZhSuwp/d5RzFLwqnaNr9jlSE/L1qul+XeK1Ik3uweJXlbGxW+oNEBQ3GG5RCN9tDDhHjYpMin34m4co+3Tmz2OKuroc0kSs/bBxzz0eLvQiMr4XMk/e+Z0ryQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMWE2z4q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D90X08wF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMWE2z4q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D90X08wF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fecI2571717
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 04:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	px8uh+g8dric/vO0B2ClWq8oPx0dHzsAVJ73+3m9hns=; b=lMWE2z4qGonlhCZa
	8N9LnJNH9KpaB21UTfCkqigd9YNOyiy1D07RwBLBZLZBsiX09MQdVWxLLa2P10Xd
	2sklqRxqgjFWZhvZvCW5T6C7U/y95S3Wl8G9cxEESdSg8xxiIIP+Gzmgh295YClD
	Rzn95r3KshOqTyEy0S8KAQKycHxFoog8OUx9/e0ocWkfh775EvjnLGN1xdkj+Ffs
	joYC62dTgUFdsUVACzOwacBL1oUSZKuQ3FAdayEmHqSHt1I3dZFPmbF6w39BJvMh
	dlyF2RhXUEsxvvF2SwW7/NtKsiSA9GaVYoKYy88rDZxK3qYls2iafjfy3qrtj6Fy
	bU2RkA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm3scjy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 04:45:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso2449770a91.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 21:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785127552; x=1785732352; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=px8uh+g8dric/vO0B2ClWq8oPx0dHzsAVJ73+3m9hns=;
        b=D90X08wF1oCfMEI35mfemr3o4DRiyMMsc7AVBtY+sJXgbAErU6q9wHm54gBOGGtxk2
         TXhC2BVAb5JqdytDlnwtcarSuLu+3UnQzBwJEB88Mr+S6Dp8qHbGyh4OCX6R79muq05o
         SikQS61x+0oWv8IWDIAt8pxChwtcFQ2SkoPAgUedjqaGh5qHZPJCrcsEqzGnToePdL8+
         XqhB4+D55SwqnVXn1x76XmpXGkD4Ma5w4sncQnl5x5TD33lyGwT3ktROtW38NVHk6GIn
         So2C1HSi/app9X0kwRS6fkwBuIaEfMnL1PXWRYeZp723rl02hj0xvX/nJBrsKLoiShpD
         WoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785127552; x=1785732352;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=px8uh+g8dric/vO0B2ClWq8oPx0dHzsAVJ73+3m9hns=;
        b=GrEBY5pBVUl7E8KlokoX2b8HH32yihbIlfViSoh3bSjCoi5StULpjmYT9QlvCrohM6
         2owfDgyTwrcM3mPzrgdEl5UZFqR9oW5oS0m4Qtwrfw5HDuR0lIW5nujQsEjMbCxU+P5J
         WzlQeK73BCeRMAoGH4iLmi5RCxGZXYB9dsakeDv1saSimHuvXybpwQNc7fRtux9FOa9E
         USfRQQnjGlafPwdCVumuItw2kx1oVH3A8f97k4FNS8oJowYtl8lXhUhq57iBLzB3hgfw
         mA1Swt22JHj3alOXLcVi9eWf7KMulMrPDxJZ67rAnG1QhlocWsYVLgNQheFo4WmuC2wZ
         nNxg==
X-Gm-Message-State: AOJu0YxvJ8sh6EsgfujH3Wb6gle1b0Ujc14VdyF5Ox+qR2M5pvMWdGvK
	pBoc1To3+qTOp+ZdlBZWpW5/67iCFweXA/0//v3NauOiaK6/jET/NcmPclWSxlGsnus/GFzEabk
	CBpv19vedFhvyf8u1sEtbTd7b6UC6WjoHHKBkUYZsPgErTXxaK8UCacKLxVLWTZQ21elor1CkfX
	GyhHg=
X-Gm-Gg: AR+sD127EwOMNqXFgR8VmKmoJ6xjYohVm3BpJxwcD+cm4SjuKIeXod7EFBEBEvgyqP+
	3gl4mQZzhTcKtIwv84PhYS0Am2t4aOg7LGsv66hQbQR4O7J9cIVJQizth1AyQLAb74MuoC8MLvo
	PmgINQjETql8CD78Tj1mXQcT2odL+3dvoohrlYRIZuRXW65Zn34a8BOtwdz/jwT2WOWOVqMPPaj
	nT5oX1W9G4K7p6SMaIov4ZF5R3rJvkpPy7obK37cGRUd/2szYE2mi3LUOgPCUqTo11vkP8NZU1c
	HCDZkNyCwlUwELJDLutVuRKvg3ZPkSlupAi5/qzZwn8SMa2xjuzXtdaEsJK+A0aTbwdBisS0EW7
	zPBjabeje9llFhJI9jztyIaoUl8qnf7lP
X-Received: by 2002:a17:90b:4d0e:b0:37f:a915:1c29 with SMTP id 98e67ed59e1d1-38f29527048mr6680351a91.19.1785127551993;
        Sun, 26 Jul 2026 21:45:51 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0e:b0:37f:a915:1c29 with SMTP id 98e67ed59e1d1-38f29527048mr6680322a91.19.1785127551554;
        Sun, 26 Jul 2026 21:45:51 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e261fsm29767458eec.6.2026.07.26.21.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 21:45:51 -0700 (PDT)
Message-ID: <b70e0e39-880e-dea0-1ca4-8d852b53f41f@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:15:47 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v10 08/14] media: iris: Add power sequence for glymur
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
        media-ci@linuxtv.org
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-8-de451559e88b@oss.qualcomm.com>
 <20260726060536.A27031F000E9@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260726060536.A27031F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfX9ktoKxYLYfuJ
 N4/356l2+Yqqk6tZ3H4PEzPYveNZSRE+MqRwlTuGgAYbeMPNcV22r5hUi3pSWu+ZPTaIy44beew
 9vgUefUFzl17VC68NM3VgTC35ya+P3U0VhhWVjX2n3vOZwGsAwJZPJ5nY5AP3qMMQCAcCoUTjMK
 +XbPbtL6hGlulrMGAiyUSDyIw5MXEuZMpbtyLt667uCZTKAlqZfUzjEI6oXToo5LgpHtqIHkBrL
 /PfJl+ujR7e0lOa3ejnU6h4T//c4WymcsQjZi6/Q01d2dlBjrQrbA/53jov9uMk1OSgMZEkDmj5
 JapnUiIkxCQTIHN/aGOwXTEjj0iTNuWHv4fHPuSVEtrYIKuEyHrg4Xm1Leopdrq6OZQMcilW183
 YiAhfBPHgVs9XqMede7XZCRvgpN30b244YAASoO5QPwT6lOFzyXwAP6Ptmsc1GBE3ZnVseWnQeu
 RATQTPuZ89h9oW9Cb+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfX4JM32p4Y6xo6
 61WbCMGdsNdCU53obIOai3f4dJc1EB/QIfdRmfKUXurNSXbEqt+fV3vW1vIisAoaxVure6U59vm
 07JoSTfT22SFDqZ48dz3O9JdHdQieYI=
X-Proofpoint-ORIG-GUID: 3wn3fJ6fkEKDm5mPfROjWYcy43NpasMY
X-Proofpoint-GUID: 3wn3fJ6fkEKDm5mPfROjWYcy43NpasMY
X-Authority-Analysis: v=2.4 cv=KanidwYD c=1 sm=1 tr=0 ts=6a66e280 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Pr5uau4MhCXbDCZRE1oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270042


On 7/26/2026 11:35 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Missing required NOC LPI DONE polling before hardware reset in iris_vpu36_power_off_vcodec causes a race condition.
> - [High] Iteratively dropping the shared device OPP rate to 0 before all cores are powered off will cause a synchronous external abort.
> --
>
> --- Patch [8]: [PATCH v10 08/14] media: iris: Add power sequence for glymur ---
> commit d2cd6a91322f190f5a10ce98b74613cfdf850a61
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> media: iris: Add power sequence for glymur
>
> This commit adds power sequencing for the glymur platform's video codec. It
> introduces support for handling multiple codec cores (vcodec0 and vcodec1) that
> share a common clock source and power rails.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> index 7cda946015558..1b08461ee4d70 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> [ ... ]
>> @@ -221,6 +221,113 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
> [ ... ]
>> +static void iris_vpu36_power_off_vcodec(struct iris_core *core, u32 core_id)
>> +{
> [ ... ]
>> +	do {
>> +		writel(power_down_prep[core_id], core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +		usleep_range(15, 20);
>> +		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
>> +
>> +		handshake_done = value & lpi_status_done[core_id];
>> +		handshake_busy = value & (lpi_status_deny[core_id] | lpi_status_active[core_id]);
>> +
>> +		if (handshake_done || !handshake_busy)
>> +			break;
> [Severity: High]
> Can this loop exit prematurely if the NOC hasn't yet transitioned to busy?
>
> If `handshake_busy` is initially 0 after writing to `power_down_prep`, the loop
> will break before the NOC LPI DONE status is asserted.
>
>> +
>> +		writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +		usleep_range(15, 20);
>> +	} while (++count < 1000);
>> +
>> +	if (!handshake_done && handshake_busy)
>> +		goto disable_power;
>> +
>> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +
>> +	writel(bridge_sw_reset[core_id] | bridge_hw_reset[core_id],
>> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> [Severity: High]
> Without an additional poll for the DONE status (as seen in
> `iris_vpu33_power_off_hardware`), couldn't asserting a bridge reset here while
> the NOC is still active or transitioning cause a hardware bus hang?

Ack.

>> +	writel(bridge_hw_reset[core_id], core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +
>> +disable_power:
>> +	iris_genpd_set_hwmode(&core->vcodec[core_id], false);
>> +	iris_disable_power_domain_and_clocks(core, &core->vcodec[core_id]);
>> +}
>> +
>> +static void iris_vpu36_power_off_hw(struct iris_core *core)
>> +{
>> +	u32 num_cores = core->iris_platform_data->num_cores;
>> +	int i;
>> +
>> +	for (i = 0; i < num_cores; i++)
>> +		iris_vpu36_power_off_vcodec(core, i);
> [Severity: High]
> Could this loop cause a synchronous external abort when shutting down multiple
> cores?
>
> When `iris_vpu36_power_off_vcodec()` powers off the first core, it reaches
> the `disable_power` label and calls `iris_disable_power_domain_and_clocks()`,
> which executes:
>
>     iris_opp_set_rate(core->dev, 0);
>
> When the loop then iterates to the next core, `iris_vpu36_power_off_vcodec()`
> will read hardware registers such as `WRAPPER_CORE_POWER_STATUS` and
> `WRAPPER_CORE_CLOCK_CONFIG`. Is it safe to read these registers when the
> shared device voltage vote (OPP rate) has already been dropped to 0?

iris_opp_set_rate(core->dev, 0) sets the rate to the minimum OPP defined
in the DT — it does not disable the voltage. The actual voltage rail stays
up until all vcodec and ctrl power domains are put_sync'd, so register
accesses in subsequent loop iterations remain safe.

>> +}
