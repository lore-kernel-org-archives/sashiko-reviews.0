Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4014F55D7
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 19:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791574809; cv=pass; b=UpjB8Zl4T3tRqug8ZBuR2/+yjNSiO3o1dGhE9fY0kkpe6lZ7YL7+hPZxRA5nitzCptkTJtXMOjG4Xn+HboofElzfIYq6UE/PrXNyNUT70vAluw9Q5ouq3BD2nbRZw/vOqZxYZcNb6fjkgjBbfY+WWQ9bnHef3kNjOQEk9XaDnLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791574809; c=relaxed/simple;
	bh=2O6pst0/1FQDlhMhItqNEDGgoaAgA9DjcHfY4XCG4VY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ktmpx1wMWe6Vd5xqNM/F2BHF6IwjebA+RSFMYwz3R9Hlt5HlEzdXw3bBqnB0WK1PPI9EdoXV5PUUdau8dFeJZunXU9OcAFnThB7Gx84AULAXfqg7YIvbN1G9SvIeuNyloK9CRAn8ptP4MaSGs7Hq2l+5SRDRbZTFtpNSlOFhmPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nA8667dH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X7A0wkiT; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nA8667dH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X7A0wkiT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZrRA1880589
	for <sashiko-reviews@lists.linux.dev>; Fri, 9 Oct 2026 19:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QQ2r3xkMRh8ycVpIBxe6QayV
	BoNOyUv0pU4RTDpoWM0=; b=nA8667dHpj+fwjOM/OHZoKksqU6iH8w7BFFagmCA
	7sWvkrw99JLmWf27DmoYxHYhHI/8CvULv/JyarDhJalQGKVAdSxJJgFMxOEg6GzT
	Z4Ij3Lnz06sEz6+z/adygbrE1jhPFlQhHZBtjW+h3Zf3nTxi/nu02e65tMMb/JTL
	kpj0EgujEpNpS3SQQykihirDCLQm/1t8d9s8h7YlfvJEWqmLVVXlJId9NAj62UPi
	i4DZM4UBiaJQxSxFcd14odLlkJbOX4PozEoYPq/CseWoyw8hQaUTpKuHBCbYF68D
	RcTZj7B7aTIOBK70plkj4hoh2Qns1C/9VC+hE3qFUoB5nA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t8gfgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 19:39:53 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8461ade272bso193987b3.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 12:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791574792; cv=none;
        d=google.com; s=arc-20260327;
        b=lnLkr1nl1QemloNTK1LFXcu1aZtNsq3usSlcNBycdsCSIbt/JeSi64t2DiXns/9Gsl
         UZ9YnByiSM13KJx4pzNYm/N5B4+zn/hP8r7CL7z2uzIlucq1elU2jnNYIoxxrGn+FZy2
         yZ3Ny7jnm1Ea3LaQgZntp3foTlU8HS83UKjBO95PiGLJF6AI0clGZhs6Fbj5fd5mE3kX
         UKbt+9pLLvWN7kxX8RR7tDuNpV30J1CIQudZXCcFXbRMkckQcmG5jRtItQTyOqM3EcKT
         admxalsi4nboZpmzOzBLdCNPgZ4sJwHU8vdHeHaZE7CqBYBDIxda9tj2DyCejxJTzqdm
         nOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QQ2r3xkMRh8ycVpIBxe6QayVBoNOyUv0pU4RTDpoWM0=;
        fh=HArvwApbWRc5s+dG4uksARDc2USaKhj7m0JLvIdWbHs=;
        b=DIa22iLzBPc6IDDiwYx7ukOjYr639HnGkVlAgKc9Q7eCxdkRBQXcGXx7Fm8Eq1YZ6n
         6P0z9VBeIy8HKmDJ+9afkXimLNobKWbjEj3n+mBXSwd736Wq3IY61+uZ/G6Xc0wzytVr
         4Ys2eQETyDG/ibY4DN5YGtSlm9cK3S5eu5hXEa9MhkI57Gx3GNB+Dyw2Dw6K9RkBGpgD
         KvYxLVAjrl0kdwT1wpgjmCNbSqi/MJnekNqE8xU0XyFDAjHRjF0pm9m3wJmOoRtHDEKk
         Y5vlj+yg+TfSd9LCGjpW+ba0ZrLj4f/5ZxtX8ZPBg/zZCLngx5dxHDBGViWMOEgNLg9G
         6bhg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791574792; x=1792179592; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQ2r3xkMRh8ycVpIBxe6QayVBoNOyUv0pU4RTDpoWM0=;
        b=X7A0wkiTxtYeFVzjXTnn18DtEvOxz67p68c18HJHh778W24nPuJjRrStTr5gbnEZOm
         ywKHrtOCTD/6l1tyl46rM21MUzGT+SYSB5nB77Rfh++a4OJeGHC1HGBQRSKv53mxAdv6
         d4SO8R4VOtZnirt1YOWe70f56LYjRsZT6qKGTXlYb+by302I1YSHws9G3tBkPNUF1az4
         pfrYAU1m+okO4DMX6vd4q5wvPwK5BzRwf+JJB6M/KECnps1WNpt3nCIsELPfi96Ujlx3
         uLo/R1IMAoBJ9SI62Pc4yUX1PQ1pQ873JhVMmiIJzVvKZhnvDgKhXS4ah5dbfs3qD2P1
         N5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791574792; x=1792179592;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQ2r3xkMRh8ycVpIBxe6QayVBoNOyUv0pU4RTDpoWM0=;
        b=FjkLhY1KlGosFzaLF0rDQO9bQw9PLBwPEfoB8GxT3D/fKPlYWXjavqfzpTr9RziSoy
         UYLm0Le8lOI2tu9scZhK/E/VNm2Pli5KmnZ7QPUJLtTCK9jM/IA5DvfxvzxRcZvmQu9u
         ONBQyRZX3CRtemhFVhqgiKb2mZwou3xLGfRg/IE/OlJ8Q/4//8RAn6PzuGzqXavBpSJu
         d4QQEa6SoA7HRmIDR81NHcPE1O1PxZGwf9HnPOqGiBgjHAAMetyVeNXtHZqLCqzLE9KH
         cb75nL0vbx9P6upYTOL0LB7Gu4DP5ESd0uv2sP4WkutBWmOjjmDTRA5N4L01bD+GTBZ6
         C43g==
X-Gm-Message-State: AFq9FYJPj7qTft/DaP6jYNkCg4wgSPqwh0k7iLJivjMcZVc6FWiP4Lnd
	gdMYzjQ357/FZVTKXX5Y7Sn9nNBVcGu/9XHFBc47n4l2MhdYgxFL49GzXNGsU4hg/B0JD6oWtl+
	gIdPsoyN4VZwrjbi03eUua1R9mML06dMu/8Oz+W1plVggUsDF1yCm6yBTFhmNTotzBkU5W0/ohj
	JPlXcY+pVJ9OcZecQnG2hM82Ce/lR0LYvEsDu7zBgN3fPheQ==
X-Gm-Gg: AYBFou0OOA4AwU+bgtZJ/8PdT8SHNQFg1F0rPml74IebyPz2WpkXaggR+Jk+G3ZYPQo
	EQLc++1vOgoIsQIvNq3ss5bGxPH6UYXRE5o9L74fddqMwC+y4sn6v5xEe2S6KkQ01yjS6F1ov1N
	8SqfyT6lZqL9wIExYcjp52Q18pRP5WKfNhNj5lnbYPSbt4HHGn+2aQ6Lo3lOg=
X-Received: by 2002:a05:690c:660c:b0:8ac:d426:1059 with SMTP id 00721157ae682-8b07edb067amr9225757b3.21.1791574792181;
        Fri, 09 Oct 2026 12:39:52 -0700 (PDT)
X-Received: by 2002:a05:690c:660c:b0:8ac:d426:1059 with SMTP id
 00721157ae682-8b07edb067amr9225697b3.21.1791574791690; Fri, 09 Oct 2026
 12:39:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-6-0322ca5dc10c@oss.qualcomm.com>
 <20260926064921.976721F000FF@smtp.kernel.org> <4befec0d-2e6e-ede6-64d7-58e1123eb1b5@oss.qualcomm.com>
 <txowl3kctv2oca5gqqtiuabh3bffqbb5ntbsfeele5bclzaxrx@4pfvzkccpybj> <9b15a39a-eca2-d26e-e060-d32879179b00@oss.qualcomm.com>
In-Reply-To: <9b15a39a-eca2-d26e-e060-d32879179b00@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 21:39:38 +0200
X-Gm-Features: AclHuK-GUeZs1U9UByJL7NYJ-Y5C0OriC66HSIDLljUMuSVQrANqtjtFKF7Fn2Y
Message-ID: <CAO9ioeUvV+3sME9P1bJTpDOSty=uojOKak659XCf337++vPVNg@mail.gmail.com>
Subject: Re: [PATCH v5 06/13] media: iris: Route buffers to the matching
 context bank device
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>, media-ci@linuxtv.org,
        devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: ggiMhysTuC_6QfPuTjedlsprTX1j4kqK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3OCBTYWx0ZWRfXwD4jR7cGHhqY
 0plxcWlJCMT067EOzXXEu7u3GWgdUaLq3q84ZZPP+JH8FmXKmXSubcX7RCLAADAu8Bcepke1YE8
 Y/V+MEvdZSyBrCxlwfzweJV0rRtu42u+TgCkyznophBQ2nCs8aVfsZrPpxLcEB2HP8rEP9uKZ/R
 nYsCEtje4dZdKLdO3QAAbeDssHymjVhLwMS2bCb0S3DafZzEQSSm7uodRPShqBWKHjvpdG7cwre
 xAPPp4Kd16zkd+XzQpjRxQzpFbhMp3JtiuR4DN6yIma5AIvrSslQcnm4dLMtWyi1dBnTtUEz7t8
 xuSrj4uwZw+d/pvIzGVZjTUm3OV7trkr+YFmyquU3y83dRzG5Eg/IgQjUCLe508VweOje6uK35n
 eBoWRdxr7763AG11vA05u5+pE7o2y0U6eO+fo8NG7PdLLj/l/NDCES7X1rLmXyNUP/w+XQwv+ym
 fIU4BlCa0x+dCI4LVbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3OCBTYWx0ZWRfXzOmVOKCJ1aXs
 TOHZg4W7J1ZFPrY0wveDU3QCK2VRo1hrw/Ov84Ihb4u8xBvnLe/z0q1yDzP0YtRdUMAbP09rZEr
 Snl3TYBnUubdk0dbFBWGzUR6X7Ct+xg=
X-Proofpoint-ORIG-GUID: ggiMhysTuC_6QfPuTjedlsprTX1j4kqK
X-Authority-Analysis: v=2.4 cv=ELeTQFZC c=1 sm=1 tr=0 ts=6ac94309 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=aq-MA5FNgFGuVIMhGHYA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090078

On Fri, 9 Oct 2026 at 13:14, Vishnu Reddy
<busanna.reddy@oss.qualcomm.com> wrote:
>
>
> On 10/8/2026 3:48 PM, Dmitry Baryshkov wrote:
> > On Sat, Sep 26, 2026 at 02:01:21PM +0530, Vishnu Reddy wrote:
> >>
> >> On 9/26/2026 12:19 PM, sashiko-bot@kernel.org wrote:
> >>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> >>> - [High] media: use-after-free of context bank devices during deferred V4L2 cleanup
> >>> --
> >>>
> >>> commit 720de65140e46882c5d0651161ef771fcb1189a2
> >>> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >>>
> >>> media: iris: Route buffers to the matching context bank device
> >>>
> >>> The VPU issues DMA through several SMMU streams, and the hardware does
> >>> not give every stream the same addressable range. The non-pixel stream
> >>> cannot address the low 600MB of IOVA space, while the pixel stream can
> >>> address the full range.
> >>> Add iris_get_cb_dev(), which maps a buffer type to the owning context
> >>> bank device. Bitstream and internal buffers (BIN, ARP, COMV, LINE,
> >>> NON_COMV, PERSIST) belong to the non-pixel device, and uncompressed
> >>> buffers (DPB, PARTIAL, SCRATCH_1, SCRATCH_2, VPSS) to the pixel device.
> >>> BUF_INPUT and BUF_OUTPUT depend on direction and are resolved from
> >>> inst->domain: for a decoder the input is non-pixel and the output pixel,
> >>> and the other way round for an encoder.
> >>> Fall back to core->dev whenever the relevant context bank device is
> >>> absent, so platforms still describing "iommus" on the parent iris node
> >>> behave exactly as before to maintain backward compatibility.
> >>>
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> >>>> index eb8de60c1177f..6e03d13ac1a79 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> >>>> @@ -531,7 +531,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
> >>>>                                   enum iris_buffer_type buffer_type, u32 index)
> >>>>  {
> >>>>    struct iris_buffers *buffers = &inst->buffers[buffer_type];
> >>>> -  struct iris_core *core = inst->core;
> >>>> +  struct device *dev = iris_get_cb_dev(inst, buffer_type);
> >>> [Severity: High]
> >>> Does this acquire the context bank device for DMA mapping without taking a
> >>> reference to guarantee its lifetime matches the buffer?
> >>>
> >>> If iris_remove() explicitly calls platform_device_unregister() on these
> >>> devices upon sysfs driver unbind, and no standard buffers are active, their
> >>> refcount can drop to 0 and they will be freed.
> >> This is not true. Remove callback cannot complete if driver module->refcnt,
> >> refcounted during open, and not decremented with corresponding close call.
> >> iris_close() would call iris_destroy_internal_buffers() to free up the buffers
> >> before un-registering the device.
> > I don't follow this comment. There is nothing about module removal.
> > Sashiko here (and in several other comments) tells about using the
> > `unbind` file in sysfs to unbind the driver from the device. The module
> > is still present in the memory, the module refcount is not decremented.
>
> Thanks for clarifying the comment. Detaching the driver from device at runtime
> might leave the interaction with hardware unclosed.
> Would prefer adding something like this
>     .suppress_bind_attrs = true;

Please don't. It would be a sing of a badly written driver.

>
> Again, this is not just applicable to sub-node devices, but to parent device
> too. Sashiko should classify this as a pre-existing issue.

Yes, Sashiko is writing about the parent. It can't be a preexisting
issue, because there were no extra context bank mappings beforehand.

>
> >>>>    struct iris_buffer *buffer;
> >>>>
> >>>>    if (!buffers->size)
> >>> [ ... ]
> >>>
> >>>> @@ -650,10 +650,10 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
> >>>>
> >>>>  void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
> >>>>  {
> >>>> -  struct iris_core *core = inst->core;
> >>>> +  struct device *dev = iris_get_cb_dev(inst, buffer->type);
> >>>>
> >>>>    list_del(&buffer->list);
> >>>> -  dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
> >>>> +  dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
> >>> [Severity: High]
> >>> Can this result in a use-after-free of the context bank device during
> >>> deferred V4L2 cleanup?
> >>>
> >>> If standard buffers are active, videobuf2 holds a reference. However, during
> >>> deferred cleanup in iris_close(), v4l2_m2m_ctx_release() frees standard
> >>> buffers before iris_destroy_all_internal_buffers() runs. This drops the
> >>> final refcount, freeing the devices.
> >> iris_destroy_all_internal_buffers() frees the internal buffers which is managed
> >> within the driver outside the scope of v4l2_m2m_ctx_release().
> >>
> >>> Will this fetch and dereference the freed device pointer, passing it to
> >>> dma_free_attrs()? Additionally, does the devm-allocated core also get freed
> >>> on unbind, making inst->core a dangling pointer here?
> >> Unbind will not happen until iris_close() completes(explained above), which
> >> avoids this scenario.
> >>



-- 
With best wishes
Dmitry
