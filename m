Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849B843A80A
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 05:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791869224; cv=none; b=IKyz26JJbZTIlAlFneu+HvyCeXLy/BP9NOvlB4DLcmWEl2BDrsHihqDB2JrblGxr6h6PM0DR9SC+YKmvdKYq9eryISgJ0KHYS/as4Y5f/DJMzz08mGfM5WTknHXu6YhgoC3pVL8mTdzk33RulNfZSQGvAMV529L/knmLKW0RLzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791869224; c=relaxed/simple;
	bh=ZfNaWKsAbncNMqZkU7N4j0OkCpAgt94wB3w2if4Q5OY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MUdBhrPxsG29ROnzoZ1CEowDoqR5oPHFkPUiHmp2bsVT0lTrQM/5J2Jk58vPkz4QS60eIDQAi9MvpGu+73GDgw39iWyhO/cTNfxATYhEo0o9SkCOauvOuFLeSO3uWIZtNrWWQs1hzAyQ5xQcerj/KPrlBsshsi/76tynU2T6cww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jY7wJjxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aupTZQPd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jY7wJjxv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aupTZQPd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21MkW3509558
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 05:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YRsgQMQw6PX7D0IOH1wURx/XjvgO77sRYYgiaOmNJpA=; b=jY7wJjxv3vkEwmM2
	RD6EC1GTjnGHLN1B/G3m6a7LkvLFbzBklwBOjFgpRzGsQ2860Dk2TU1DkNSLBkFx
	8/Bgt1YBsP8/fxHEvmkdY+0IqdFULHpCip8tb+SGdGHLZ616sFRD+UoVXEnufTIW
	kCUiO4rzcQRPDlGXqKsNgdw+jSvLIZYW5PBXFoYRsp+7c+rvfk25J78mdjA8YCef
	uwgJFhDCJ3wWqTGDQ//bSpY+nalHvBUpagH9E8dxpgcOm02/u52Dc0oopQRTIUCR
	urUXC9cR2RRF84FIQmau97sGOA2VW4Ft/LvwuWMxKltw0KQCRNeD7hU/HGyahHVJ
	AmyxJA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc4dpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 05:27:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7e0321ec1so3178456a12.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 22:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791869221; x=1792474021; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRsgQMQw6PX7D0IOH1wURx/XjvgO77sRYYgiaOmNJpA=;
        b=aupTZQPdVCb8p41DSPcn4ZVIukNiy7laTh6AH+zfnbRtSeM37vRgAMzv6TUDac92gA
         BUDRPbOS2gT9GojTxDiqwaqy2aSjZ93O4sMGls1g17TVxWKShEU0v4Gzkopv86qW9VMY
         vNNaYL1O1GDvCf2vSYw7NSriv5KmBvj4Y3iJ7Zx0rS/o4SSM13HP6eITWSPxzcb2pAgR
         1f7VHkndxiwf4SdVZmKmA7eCsfHruJN1XZY4ZKVOC1Y2SKMR7rIHHZwh0YDnnKKujT3i
         rZTYHlHmAvEcjPd4P7Ac0r7JTmA4L3JaIlPVJ2kJRHClROeeORFutiZMuhkgxkRb5hJR
         uhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869221; x=1792474021;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YRsgQMQw6PX7D0IOH1wURx/XjvgO77sRYYgiaOmNJpA=;
        b=q76NreWNRuNMdhgV3Uq0vxTF5HGKhjw7JHwqPbLbFdL5UaUkGW6p8I+YaMVE3ZVCff
         5BPIIeEcfoH5ejQoLvEupUc8yBPF+ysJPSZvHsVAcfMVYPkIddCAIAf4zAp/EVVys24D
         M19EyQGyP7PmlSqrg69bkptgLNdp2UZ5iV0fReDxPFPLrummyDIp4hjfhuu8SM+riX6G
         TTA4dU+ZbNPdzyZS/bdk9VHyQbPdXWNUTh9OeJXAzeiMKiRE8lvT7z0eP6RHanhJrxBf
         ahbdsn1y7XZDoEC+19aWsY1+A+Vl/tdMZHZmMs3yx+a5qPMsMOoj0kLR//M4+yadFdBv
         /q+w==
X-Gm-Message-State: AFq9FYKoEOYSYtEWejkoe9mQCj2YJA6ZnTcfOZfZsOI6kb6wKKnw/xX/
	uvOJ3MsQQq+FrfKeyL0NOH+klFu6Ot/cJgS3ZBi0nQXK/qWP1PNZCEQ4iomOLFktf6nBxgv6M1P
	dkJxNrYIbFXALSIolI09/1zoNh8KrWFxUJdvLkAlYldmZ47oyUxsBG1u9Tq7Dwi1CSiJiR+2ajQ
	v4qBM=
X-Gm-Gg: AYBFou1jx2x0KcKwKUv6JoaS7HQ3nOQ6zmTOk5lZMiBU8yLtBw52GNENwqTxYK7p6Wd
	6v1ueeF34nTIsIx/PBXoTApPzxPluR34JtDngaduRc3qxxUM03xBS2seSEcAZ11yTt0dXLMJLbz
	mXLzFotqvEyBN8NnQibfpnjZPXUP8wpHRDTLjGAiT8wmOWzMXWYkE5FSSyp5rIbjoOclkcgL/my
	ZuVvEC+XZNfOWDwdd9AyQm3HL+6tW/+9pnnHBFOt4xXsZu49tZBm6ry2MrkAFezFk37OWlajfKU
	5ZUtPCCTr8KID5bys0ipcHwYBYkPWVQViCL8nNqRi/kgzEcsrGv8dqq2PFg0rOaXJwkOafTeVqN
	P6kIdhtkfq5Ac6icJbACTFaK0a4Jzowjzqw==
X-Received: by 2002:a05:6a20:8f29:b0:3e0:2b03:4008 with SMTP id adf61e73a8af0-3e16bd8348cmr9457046637.12.1791869220742;
        Mon, 12 Oct 2026 22:27:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:8f29:b0:3e0:2b03:4008 with SMTP id adf61e73a8af0-3e16bd8348cmr9457028637.12.1791869220208;
        Mon, 12 Oct 2026 22:27:00 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3106e07sm4533371b3a.11.2026.10.12.22.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 22:26:59 -0700 (PDT)
Message-ID: <4c70c070-5504-4a98-88ae-e4fedb976e2f@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:56:56 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 12/17] wifi: ath12k: Enable MSI interrupt support
 for DP interrupt
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
 <20261008-mpp_bringup-v1-12-2c5797b5e4ac@oss.qualcomm.com>
 <sashiko-outbox-164040@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-164040@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMSBTYWx0ZWRfX/kDEORRlJwsd
 1GLtgcilbzkC7voq4JLKhD8gBTozzJHfnqoVBOrkgnjL+8huaPR47K1Mzs6E4fta+NtcNy1BToi
 ypEZaGEhaOtnMy5k9DORm5BsThwv0LA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMSBTYWx0ZWRfXz+WRtjp/pkca
 jg+r7lWIjZk21mix63Os2Y8TxOY6Z21n+RjxG1CiOt9idxhCIrUkF1rvtqN7tPB2ZoB/kp4Dz54
 tTPTryqjkrou/Jo0beodn4rbil3ktKJWE7jt4d2gHaVNEOC9NogEl9MuvBjnXt+sYXQFyCJDNBy
 yhiZi3jmiEZzLaFfjadyF3zdCfYoQHnxYcsK3XztN7MNofBSa1hk6vJ5J6/9NwYAWv1D0vVHrDs
 Un1kWcg3Ro9oOVYjuUvGSTxdM7Z5h8dOe2iB6cqar6XrV7s5zL9zohvZLrFAjMvZ3LLe2ymiqFQ
 UCG+kRoZhOdR49BAyhSI7tKfPAfWmecM17H9UUlLChKXGL6hY0QVUJBwfSqlMm5AAzRWbLGdxdV
 YeYvb7JUS3di6aFAinvO/k+u56vKZq2h8WIV5Mi4fsQLLX3yz9i5S0GqFmROlbjHNC0HYmcigCH
 kaQQzuUe0UPZbWihAjg==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acdc125 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=L5L5rDMhSj7ZP6xeACoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: oouL8PhNo9waFhG2nhjQTMeqhylRxkA8
X-Proofpoint-GUID: oouL8PhNo9waFhG2nhjQTMeqhylRxkA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130021



On 10/8/2026 4:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] ath12k: leaked IRQ disable depth when NAPI poll is aborted
> - [Medium] ath12k: NAPI netdev and MSI IRQs leak on AHB probe failure
> --
> 
> commit 05cbf53b4f5fb7b0ba611762ab10f0a7205ad37a
> Author: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> 
> wifi: ath12k: Enable MSI interrupt support for DP interrupt
>     
> Configure and request external MSI interrupts for DP ring groups on the
> QCN6432 platform. Create a NAPI context for each active external interrupt
> group and disable the corresponding IRQs while NAPI polling is in progress.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
>> index fea284c3707ba..06178b4f20d17 100644
>> --- a/drivers/net/wireless/ath/ath12k/pcic.c
>> +++ b/drivers/net/wireless/ath/ath12k/pcic.c
>> @@ -181,6 +181,112 @@ static irqreturn_t ath12k_pcic_ce_interrupt_handler(int irq, void *arg)
>>  	return IRQ_HANDLED;
>>  }
>>  
>> +static void ath12k_pcic_ext_grp_enable(struct ath12k_ext_irq_grp *irq_grp)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < irq_grp->num_irq; i++)
>> +		enable_irq(irq_grp->ab->irq_num[irq_grp->irqs[i]]);
>> +}
>> +
>> +static int ath12k_pcic_ext_grp_napi_poll(struct napi_struct *napi, int budget)
>> +{
>> +	struct ath12k_ext_irq_grp *irq_grp = container_of(napi,
>> +						struct ath12k_ext_irq_grp,
>> +						napi);
>> +	struct ath12k_base *ab = irq_grp->ab;
>> +	int work_done;
>> +
>> +	work_done = ath12k_dp_service_srng(ab->dp, irq_grp, budget);
>> +	if (work_done < budget) {
>> +		if (likely(napi_complete_done(napi, work_done)))
>> +			ath12k_pcic_ext_grp_enable(irq_grp);
>> +	}
> 
> [Severity: Medium]
> Can this leak the OS-level IRQ disable depth?
> 
> If napi_disable() interrupts a scheduled NAPI instance before it runs, or if
> the poll uses its full budget, the networking core (__napi_poll in
> net/core/dev.c) observes napi_disable_pending() and calls napi_complete()
> directly without scheduling the driver's custom poll loop again.
> 
> Because the hardware IRQ handler (ath12k_pci_ext_interrupt_handler) uses
> disable_irq_nosync() instead of masking the interrupt via device registers,
> this skips the paired enable_irq() call here, leaving the OS-level IRQ disable
> depth unbalanced.
> 
> The driver's teardown path (ath12k_pci_ext_irq_disable) further increments
> the depth by blindly calling disable_irq_nosync(). Upon resume or
> re-enablement, enable_irq() will only decrement the leaked depth by 1,
> leaving the IRQ physically disabled permanently.
> 

This is handled by the ATH12K_FLAG_EXT_IRQ_ENABLED flag. The IRQ handler checks this flag
before disabling the IRQ and scheduling NAPI. During teardown, this flag is cleared using
test_and_clear_bit(), so subsequent IRQ handler calls will return without disabling the
IRQ or scheduling NAPI.

>> +
>> +	if (work_done > budget)
>> +		work_done = budget;
>> +
>> +	return work_done;
>> +}
>> +
>> +static int ath12k_pcic_ext_irq_config(struct ath12k_base *ab,
>> +				      struct msi_desc **msi_desc, int num_msi)
>> +{
>> +	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
>> +	struct ath12k_ext_irq_grp *irq_grp;
>> +	int j, i, k, vec_idx = 0, ret = 0;
>> +	u8 userpd_id = ab_ahb->userpd_id;
>> +	u32 num_irq, base_idx;
>> +	struct msi_desc *desc;
>> +
>> +	base_idx = ATH12K_MSI_IRQ_CE0_OFFSET + CE_COUNT_MAX;
>> +
>> +	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
>> +		num_irq = 0;
>> +		desc = msi_desc[vec_idx];
>> +		irq_grp = &ab->ext_irq_grp[i];
>> +		irq_grp->ab = ab;
>> +		irq_grp->grp_id = i;
>> +
>> +		if (ab->hw_params->ring_mask->tx[i] ||
>> +		    ab->hw_params->ring_mask->rx[i] ||
>> +		    ab->hw_params->ring_mask->rx_err[i] ||
>> +		    ab->hw_params->ring_mask->rx_wbm_rel[i] ||
>> +		    ab->hw_params->ring_mask->reo_status[i] ||
>> +		    ab->hw_params->ring_mask->host2rxdma[i] ||
>> +		    ab->hw_params->ring_mask->rx_mon_dest[i]) {
>> +			num_irq = 1;
>> +		}
>> +
>> +		if (!num_irq)
>> +			continue;
>> +
>> +		irq_grp->napi_ndev = alloc_netdev_dummy(0);
> 
> [Severity: Medium]
> Does this dummy netdev and the associated MSI IRQs leak if probe fails?
> 
> For hybrid bus devices (e.g., QCN6432), ath12k_ahb_probe() delegates IRQ
> configuration to ath12k_pcic_config_irq(), which explicitly allocates memory
> for dummy NAPI netdevs (alloc_netdev_dummy()) and manually requests MSIs
> without using devm_ variants.
> 
> If ath12k_ahb_probe() fails in subsequent initialization steps (such as
> arch_init or ath12k_core_init), the error handling paths jump to labels
> (err_deinit_arch, err_rproc_deconfigure) that appear to skip releasing these
> resources by not calling ath12k_pcic_free_irq() or ath12k_ahb_disable_irq(),
> leading to a permanent memory and IRQ leak on probe failure.
> 

Sure, I will address this in the next version.
>> +		if (!irq_grp->napi_ndev) {
>> +			ret = -ENOMEM;
>> +			goto fail_allocate;
>> +		}
> 

