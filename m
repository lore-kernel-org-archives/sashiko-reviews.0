Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43AB47C10B
	for <sashiko-reviews@lists.linux.dev>; Thu,  8 Oct 2026 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454706; cv=none; b=poc6FwMm59VYSoKqkR4MsI0v/VINuNd8KRPd4ns9rXsh3SWVrv0GfQMxvyoEjrbBi09raGnOR32EGDo4HEIeqrdnsBsWic9fdPF53I1Fe4dGg7FMO3G0Lh+cI7O8dv5MygZYNtvrHrBkBMdYcnL6pDlECdO8mLNzmimXtXawuHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454706; c=relaxed/simple;
	bh=R9JoZKJ6N4nehWdjQVzzjPEYrwndohjK+G6Xy/RBHLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rgW29+gUnud96uFO5Nq0riwRapdtpE8OJIcu4cDaWc4+M4o7SBBopZC7mMsDuCtJ8/gbseEoHlqNlo8TnKOUQPnNCJ7Rd4Q/Wpq0ZQhYayCK/bY6o7FBtMXppvpLUBMP4qyfa99yRIq+JxeegmABpfT5xBOvr308HJLlf+uaIp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bX8xhlaf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AxvC+yOR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bX8xhlaf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AxvC+yOR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KXwP1169988
	for <sashiko-reviews@lists.linux.dev>; Thu, 8 Oct 2026 10:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gnmNnu5IQuIWhDzxNhJ+QFwy
	cEqUY04mJCxfNJZMHyI=; b=bX8xhlafNgsUYfbGxyxMsLUcTA21LgTKFReLfTNV
	9dbVLIrBYl7ZRQwsdNNyKdD4HFppp1RPnI3/J0ybrkh6bn2v2Eo+4QRfZS/O9jNJ
	6hncf0xSt7qTFx6woNIYDVWGzOJNbM09p+u2nbKERR73CBglUM0WuoefKyAj81BE
	kr8g5HwqkG2NK0l5kcVzNswbYVzWdhZ+4wAxFAevBN0gU7RXM9s/yj/IgtutBxNb
	/NecJq4H9nisWlvnyhppGI3qcESBFQDpR0kopMGvtDdXGXhJnDiaHdBd7Yol+CV+
	SyKr9VT4KXlxi/zsdOkA6fjW3lx30fN4bpCFtSDtCj26Hg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3actn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 08 Oct 2026 10:18:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea8067974so272351885a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 08 Oct 2026 03:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791454703; x=1792059503; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gnmNnu5IQuIWhDzxNhJ+QFwycEqUY04mJCxfNJZMHyI=;
        b=AxvC+yORkzYAjWsVpfjW+W4X+MIpr/o/J9cw1K3RnFoQDxvp/3wToXKV5NfDXaEoRl
         ahaVeauKfWkAxzghWmSv1JLNdpMqLeGj0ltW1hP3MQM+Zm61YmUt14RK5nrqVnU4MS2m
         Oq07jtl/WpTdhtgSnIpcHXVQuOWkIkFK4c+qiiXj5PfCiRL2d4AQJ3ObU83hM3yHJQ80
         ucgVm2HGawVZ4lZCONN30dNrCeqsI9mGL5pN39FbRIXezUAsiSzzBgVhnyLgKqbE9YDC
         V+TOyB1P4yJpbnc5LbHDXeWiIaukh8anytm/Ywu6NJP8SN/JrqXLU32FpnZ8sVjxNRFZ
         vmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454703; x=1792059503;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnmNnu5IQuIWhDzxNhJ+QFwycEqUY04mJCxfNJZMHyI=;
        b=ebLXEaQjDbI9c2W194KlqHqmyBJ956pb3ukAHP/6uH7JMfAhVxo99WvcHGr3a0vEuJ
         Af3I1KwEE+yPT48Rd0fQSdJqUZW5mgzg9C8BI8Vc7zv7Uyz/3HrSEQS0z6quIH00iG3F
         FxSAw/TW8eSbDaYzIw9hg7sAtTqZneyM8urO3hj9d5NPWrk7ejED8ePUN3WdDr8nPfj/
         eB1J7AapegDGTf2rHq7UxRSHlGIlTD+sgXjoKoeD6McZ9B265ixs9d++AcwrJT3Wzw0q
         hjfKMI6OMvJZHAEEYKAJxRbqw6xykLVGihZ7VwweCgr2Ai6rxlblcOzrhwVl38z4wya8
         lvPA==
X-Gm-Message-State: AFuF++lejuIHuZMH6wrqaCQSxa8AsRyjjrUMei9tWxso6cAyuBEAUTOw
	o5SnlOfzwKZcR6wgS5TxK0wWpKflbEkVlIhjn3SwekyEhxN2Nd9fdci2lvUxyJnrnV/XJ2k/9Bn
	km2ctppxsWfds7kq7ja2uvMmhYq/skffj4R4fl1SkBPZf+qX1oU3KlXYFZiT/k6MyhXQgibI=
X-Gm-Gg: AYBFou3QhnLXfVNhHkxrOZbgzq+EIqwLcdw4Y32BHM0oFq3WXPzsmUDgjM7/b6cLwX1
	KrkEMhT3RYtBs3gZnOhBCI031TrTgxqCpldAKFIXXCtXz4vhX5/oZCP7+Rl1XwzCwm84BwAbgnM
	5EK1fn0LprA//x/wPfnVW/AOmBTePDW0jIgAbxAtl3+0beSQ3ds+m7VzSDlUeWafCdmfJfpTrJG
	zoXYOQ2kbOEZSmPPp3OpJKHb6NEbcz4tMZADBO8xKHIMJ3pv3NgtTTsjF6BX0txjmBS1f37U5do
	NTcPeLC/F9rWrhji4YLRib9zTgdhJRKZsFgoal/cnLd+QLHWWcf1GJcJfbc3YBR6+llt6MjeEdh
	xk0e0DdZKris46UVyVcw86C1qeDVVoySVW8vv/5Bg5NCWsDavrWHagVne6P0ODeKLxCVhlVkCzD
	1A3x5VCkTZpojv
X-Received: by 2002:a05:620a:454f:b0:93e:9807:9791 with SMTP id af79cd13be357-93e9b85fc05mr959116985a.82.1791454702740;
        Thu, 08 Oct 2026 03:18:22 -0700 (PDT)
X-Received: by 2002:a05:620a:454f:b0:93e:9807:9791 with SMTP id af79cd13be357-93e9b85fc05mr959112585a.82.1791454702158;
        Thu, 08 Oct 2026 03:18:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd30832c1sm1066759e87.34.2026.10.08.03.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:18:20 -0700 (PDT)
Date: Thu, 8 Oct 2026 13:18:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>, media-ci@linuxtv.org,
        devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v5 06/13] media: iris: Route buffers to the matching
 context bank device
Message-ID: <txowl3kctv2oca5gqqtiuabh3bffqbb5ntbsfeele5bclzaxrx@4pfvzkccpybj>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-6-0322ca5dc10c@oss.qualcomm.com>
 <20260926064921.976721F000FF@smtp.kernel.org>
 <4befec0d-2e6e-ede6-64d7-58e1123eb1b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4befec0d-2e6e-ede6-64d7-58e1123eb1b5@oss.qualcomm.com>
X-Proofpoint-GUID: _mORWKcdeUvOnCgWhqEuZsh8tE-TRL-y
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac76def cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dwOigY39zrSKWgofuvYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MCBTYWx0ZWRfX+f8Y95zGsFId
 6M6zQcDbIWEQtdGfPwFJxgUMLviTtk2zWwkRrVYME8kuSoaSAWOxey5YKsZrRtbMY4lyveL1caT
 9CwdtEZrytGrarnLdondL55yLS+ThAo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MCBTYWx0ZWRfX3f/TNvTA9Rr+
 s+IFdmK4wM8xdr6QwX/fjnzj5S/0sv7msc1e1Zbc90cv9i4VRnwj19SaN1+f02nS4/1Z0aEnDEz
 mTIDidrVKgZ27NG26nVCYtd4ZTlllULWE1uUQKSJ6xvg3LSV0i9pBDZZ4Jl8oT0wJDWljz11r4I
 30Jy/EU6lZfo7d2/94txreuR34gk813Cho+n2CWf4ngXc1ii/K4AkGb7HNUcGGml47R3NsSnVcP
 xVrQ8KRwlcJB2QKdBI3yM43KEY0uUmG/wmVvsAO9wGy5U1+swFjCq4OAdK+ad90oimtxfG7usFm
 PhflpbrqQTI3kS8tU5EBh691R4JEzepX7023Yo+BTm9tiMzxhim+avt32HiomWyQsr2jpsLSVoq
 PMc0n1BU4+bcwz2tITmb8N7MWxNf5C/BEteoAnH2yr3pD/yR3M8z/rElc73d0xjstvFSYGEdNvn
 5+HOj1GLYrrMWpVANow==
X-Proofpoint-ORIG-GUID: _mORWKcdeUvOnCgWhqEuZsh8tE-TRL-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080040

On Sat, Sep 26, 2026 at 02:01:21PM +0530, Vishnu Reddy wrote:
> 
> 
> On 9/26/2026 12:19 PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] media: use-after-free of context bank devices during deferred V4L2 cleanup
> > --
> > 
> > commit 720de65140e46882c5d0651161ef771fcb1189a2
> > Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > 
> > media: iris: Route buffers to the matching context bank device
> > 
> > The VPU issues DMA through several SMMU streams, and the hardware does
> > not give every stream the same addressable range. The non-pixel stream
> > cannot address the low 600MB of IOVA space, while the pixel stream can
> > address the full range.
> > Add iris_get_cb_dev(), which maps a buffer type to the owning context
> > bank device. Bitstream and internal buffers (BIN, ARP, COMV, LINE,
> > NON_COMV, PERSIST) belong to the non-pixel device, and uncompressed
> > buffers (DPB, PARTIAL, SCRATCH_1, SCRATCH_2, VPSS) to the pixel device.
> > BUF_INPUT and BUF_OUTPUT depend on direction and are resolved from
> > inst->domain: for a decoder the input is non-pixel and the output pixel,
> > and the other way round for an encoder.
> > Fall back to core->dev whenever the relevant context bank device is
> > absent, so platforms still describing "iommus" on the parent iris node
> > behave exactly as before to maintain backward compatibility.
> > 
> >> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> >> index eb8de60c1177f..6e03d13ac1a79 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> >> @@ -531,7 +531,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
> >>  				       enum iris_buffer_type buffer_type, u32 index)
> >>  {
> >>  	struct iris_buffers *buffers = &inst->buffers[buffer_type];
> >> -	struct iris_core *core = inst->core;
> >> +	struct device *dev = iris_get_cb_dev(inst, buffer_type);
> > 
> > [Severity: High]
> > Does this acquire the context bank device for DMA mapping without taking a
> > reference to guarantee its lifetime matches the buffer?
> > 
> > If iris_remove() explicitly calls platform_device_unregister() on these
> > devices upon sysfs driver unbind, and no standard buffers are active, their
> > refcount can drop to 0 and they will be freed.
> 
> This is not true. Remove callback cannot complete if driver module->refcnt,
> refcounted during open, and not decremented with corresponding close call.
> iris_close() would call iris_destroy_internal_buffers() to free up the buffers
> before un-registering the device.

I don't follow this comment. There is nothing about module removal.
Sashiko here (and in several other comments) tells about using the
`unbind` file in sysfs to unbind the driver from the device. The module
is still present in the memory, the module refcount is not decremented.

> 
> > 
> >>  	struct iris_buffer *buffer;
> >>  
> >>  	if (!buffers->size)
> > 
> > [ ... ]
> > 
> >> @@ -650,10 +650,10 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
> >>  
> >>  void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
> >>  {
> >> -	struct iris_core *core = inst->core;
> >> +	struct device *dev = iris_get_cb_dev(inst, buffer->type);
> >>  
> >>  	list_del(&buffer->list);
> >> -	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
> >> +	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
> > 
> > [Severity: High]
> > Can this result in a use-after-free of the context bank device during
> > deferred V4L2 cleanup?
> > 
> > If standard buffers are active, videobuf2 holds a reference. However, during
> > deferred cleanup in iris_close(), v4l2_m2m_ctx_release() frees standard
> > buffers before iris_destroy_all_internal_buffers() runs. This drops the
> > final refcount, freeing the devices.
> 
> iris_destroy_all_internal_buffers() frees the internal buffers which is managed
> within the driver outside the scope of v4l2_m2m_ctx_release().
> 
> > 
> > Will this fetch and dereference the freed device pointer, passing it to
> > dma_free_attrs()? Additionally, does the devm-allocated core also get freed
> > on unbind, making inst->core a dangling pointer here?
> 
> Unbind will not happen until iris_close() completes(explained above), which
> avoids this scenario.
> 

-- 
With best wishes
Dmitry
