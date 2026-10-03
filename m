Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544ED325726
	for <sashiko-reviews@lists.linux.dev>; Sat,  3 Oct 2026 05:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791005581; cv=pass; b=DspRJNhpsCY68RvtWSk29iokbKWIH4ZCV6AtKa0Ik6pZ8VxQB9xpj3LKxyB5i+q6Tmi71XDFoVV0Ms+rySQyxFchMSkyvpYJzAzD5gw963xtLMl8DFua7dym3N4egJEDGLm5esSyK+WsKWtWkLkmXeiI2pgKSqWcmdSK/rBhnVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791005581; c=relaxed/simple;
	bh=2w0phctrVZyUpiB4uhMp9PMl9UmO5DGHbQ59X60tavg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nr50oAu5DSOBFA6bcUOyeIarLp1dHJUJIYO63v+XkKcqK8A28X1pztk15Onv+xtbhnN9vZUo3dOWQZHwLmTlZpbNR9kqlMbGxtEuLlDhcTlwjODB+Iz1fQXCSwx3hBXfFekDKDRH5TdaSjlLGzIOBP4A5ics9cc3wzPVWMU+s54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FptrvLkj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOkjs1ZI; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FptrvLkj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOkjs1ZI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933PXtQ2956620
	for <sashiko-reviews@lists.linux.dev>; Sat, 3 Oct 2026 05:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WBfJlNyloqVAJ23jqA1Jjpi5P6Sh0h3sH7H/cf0PtU0=; b=FptrvLkjMDFtu7nG
	83MqdEm0DUeUMT2TwQ/jl9k1k/+CEw8Vku2tf7cRg4xpP0KARt2puUKOAfTBxjLD
	kmwNo9vDpR05R3U3vJjrQ7AGSH8upUKGLyTpqP8/WNi9oEAQJkdth6I+XRJZt22O
	zI7hFW5SRc8VW6Wche0FSkcfB6CXZkjoYxiJefo2HxZEK/0IGlFMW1aiNguwpNA3
	7dr3VI9ltm4qLG1L41PyBlOzUZ40F+LQpWaDS2yPwIL6S0G4k+r4f3SshDu+DzZz
	DjwNAElNdBEDPrMTQuNBqrSQKUcJ73JXqfO25DUPKm0IRP38k7hEv32IDspHEjpX
	6QDXsw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu067v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 03 Oct 2026 05:32:58 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5d600e3ee5eso313681e0c.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 02 Oct 2026 22:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791005578; cv=none;
        d=google.com; s=arc-20260327;
        b=PrCaN/A6S5vxg/4q8NzsU4TawYjtt5HBcIyJ1rjZGk14iUouFklsxSJGSSKjIHuxDy
         PVG3hmZm8gp+T4Cs31IWSFcMx9eneUXvM/5C7xKSiA4e0KmHU8IH4k5tZsjzy4Heodia
         AXjUVQRjVEVP0yNc7Xxy30h59X3JtQCgF+I1S8Rupa/OQgjF4K0NsZZfD55PxSSUCIY3
         PI1pvY4Kg3saHAHBEdPQlt2tWD0/XsZ5NLPTuOxoQxOqUHoIrOXEa4xnCSZSzBvz/EWu
         4Ww9fDM//0jFphCuaoEDRYljzUzLjmXl5F/sDzrvQFTDR3EZI7qHxVHbtavMUdjBdbAF
         78eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WBfJlNyloqVAJ23jqA1Jjpi5P6Sh0h3sH7H/cf0PtU0=;
        fh=PZO3jNTOfurN16+rvmIkS/8PPEBmcq7MTavWKR0Ki2k=;
        b=mXFnVXYAbOGitObOrEHg3DMhP5RdYPHw+zDUw1FNZVDy9ml5EQCcTVw8DlFu3+yN5l
         OVvqI2/xbPnBk9c9bcblMW8YN24CfLO9QhbjLp9N6fu2YKXUPPAmHoY0MZCtRvZAIoDU
         ofgAZxrRH7xjjlVDqC7TdISmGsghHnU0CHQt80y97nDO5q96xhXoQ2IpgxrVFU8Dp5qx
         uj/KSkxWc0uUUuElzmnL/JdE6UVty41XFyPp2kAHfYXWF6xnYoe4Zx3t5UbTyRbhb+P2
         myr7mwYStpaJkRtDk8OKYgJbrqno0hbTLSOxbwWmTdPrY3WB+WREn8zLa3yl15gEVdh/
         Z/tg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791005578; x=1791610378; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WBfJlNyloqVAJ23jqA1Jjpi5P6Sh0h3sH7H/cf0PtU0=;
        b=bOkjs1ZIHIfmg6Xce2rsx1rRN7ml4nsp6XLny1pUABuEKgaPO/De+6w5FRytPxZz4r
         4qaQsHZPYSfk6JMmvwOzveXUpDktwZCtiPuipnK7aBtZak9sqG/Fsque2AQFmls29I0h
         J3k8WbFvf+RYweNoTJ71giob/lMokzXwdy4DlUGI0SsNjdA4706pVdJK4TEGv9HNYu49
         aMqXehj9QALgtZC+P+4P2H1JRUVSH5RTR3LlfehsffEOh99MiNktpAGCkMh2q7yzBIHL
         LFuuSKH9tuncUaFMvlWV/eQBF7KjKx5sfa6NGc4Wu8e6MHMK/C/2oecV0EHHJ2qupng6
         h8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791005578; x=1791610378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBfJlNyloqVAJ23jqA1Jjpi5P6Sh0h3sH7H/cf0PtU0=;
        b=GOchpWWQZaMcfp4ItwUQLbfn2moXtVMBMlGMMIyYMP70LIbdac1hM8t+ZqkrydpGOB
         1LsclokcLMU/yPE7qQ6EJ8tCAXZCBQR6rwseJmHfMAKaQCqkkhUjRoXA6J+6wWHQbbvq
         3ib5fqcoTxtTRcLG2Ryq3zQZJNweGZ44Tsiml2YukEBcba/iWzQlvf/L42fVyHsjgFjJ
         FCyyj8QnbUkJdqyZ56+gN0fC/c1Zinksw3pzcXcIj67EtLcxyY4xkcU3Cru7oTlWoP21
         k3DrQXas6jQ8ejr14l5udypNZSe8tNBncAQBhQN7mlyGCojcAoNQ6fdZB8W1jLT7Dt8+
         jB7w==
X-Gm-Message-State: AFq9FYJXbXyOthrGKZiJd7vd1/4aFpayuy+ue/ySwZuirOhVkA4ZFkMb
	m5AY7cXTVTqxnr+ATaE9dApXhSmML/F7iafwGmZ6Tw01Bok8fPdnY/YbzCsQ9x1AVrAOk0wTDwB
	mGfQec/TItXgiBbFAw6OSE5aoa43JNdPmIqAEFLd58FgwLdxwqaIP6aVyTRwN/1VHmneDUl/ond
	BsD0spA0FmKQVlpDwLYNr5c/5xGdB0yxJxdJNVOmm8YFp9ls4bgjqwg3ih
X-Gm-Gg: AYBFou1ir+OVgsN2pvFkZRgbvrzTFTRGyWaadJU5ltWpblGdiJtZje1yhxmbegNmScp
	YvQFmghDKNQoNffNKA2WJloI3qYtzaAlu+C5Fi0TnoCwSsrafXiLzUfmC2jYkZxMnGa2DQOtU7v
	lQnr8S0wsU+u93CLIiSjODR60z6qDrW+DLgpjUofUqKP1RhOoLcGytMe/6B99PQjPjttEkV39Hz
	wbKj17vQqdt1yUo7Q==
X-Received: by 2002:a05:6102:5494:b0:7b2:f3ff:6b34 with SMTP id ada2fe7eead31-7c2427e43cdmr428029137.1.1791005578059;
        Fri, 02 Oct 2026 22:32:58 -0700 (PDT)
X-Received: by 2002:a05:6102:5494:b0:7b2:f3ff:6b34 with SMTP id
 ada2fe7eead31-7c2427e43cdmr428021137.1.1791005577532; Fri, 02 Oct 2026
 22:32:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-6-dcf3fd37f76c@oss.qualcomm.com> <20260929061724.7E52C1F00893@smtp.kernel.org>
In-Reply-To: <20260929061724.7E52C1F00893@smtp.kernel.org>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 13:32:46 +0800
X-Gm-Features: AclHuK9aBleyJ22M62RSQUnz4PnDmFE-WZpjV34zP8HiyBjyBg5R_gBameCGqVk
Message-ID: <CACbMrhpeuzE+RgXwjfuBz24WE2Q7yCsxMWBjthy4RCtH0snkgQ@mail.gmail.com>
Subject: Re: [PATCH v17 06/11] media: qcom: camss: csid: Add support for CSID Gen4
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org, media-ci@linuxtv.org, robh@kernel.org,
        olteanv@gmail.com, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAyMSBTYWx0ZWRfX4M7RFUzh56+f
 9Ok6mE+TBP9HgKGiTFLtYBWdvyRDualvxmTZfOaaapFtzx2otvLq+z1FTK1X4n8sB0lxT7gzWwi
 D9mSEOXErzMZGKdFhi/DZS5gOw/L7c82G5bDL2OIWCfmZJYZh2roJTU+Cyx8d0oT+igT2FBoio/
 nmXzxdoS79Kb623UzfvrBjDVVt8gE2OIamWngbeG7vQ+YnlnzoWj5oSICqNrgMLd0L7cKtkqNnO
 IDLhvHGJ9VAW/BF+Yw0XcYoYYKSUWm0p2iuOkHhpiH/LlvNAnhBb11/lVY0lSbNPfUTFH6DOGDF
 3jJIok5jtD5nhphEygaIm4ytSon60viTtrCJPElTmRH5RHf5HTwS61281LkaZBvtbrSW789woad
 4MMPT3gRCcMIfSDczpJ1ix7hGNAkdj1IRG3APaxd+UiNJKr4xc+Bvq/C9RQjlo95Vx2nRxwjnCP
 0vPVnZdoT2coMOHdAAg==
X-Proofpoint-ORIG-GUID: _w_gTTEkkeq3f0KdSS3qWOjkpGe-qOCL
X-Proofpoint-GUID: _w_gTTEkkeq3f0KdSS3qWOjkpGe-qOCL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAyMSBTYWx0ZWRfXwppGTcGrRHaM
 S4uNoVJkS+jY5T6ZhstGNrJQQWuAxQEy5wH73UaKAoIQk3Z6FZLvtJL0CloHwS44qVDRszqc3W5
 XCoT/G+/QjF01ifKJwTfITXFwWcwGbQ=
X-Authority-Analysis: v=2.4 cv=XPSl2ghE c=1 sm=1 tr=0 ts=6ac0938a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=CaMBOwoDLpX39Z_i5uIA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030021

On 9/29/2026 2:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] media: qcom/camss: data race on csid->aup_update and rup_update
> - [Medium] media: qcom/camss: integer underflow in __csid_configure_rx
> --
>
> commit 611abdeb4b5da574ae292d1ff736d0d71f2f4ed2
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> media: qcom: camss: csid: Add support for CSID Gen4
>
> Add support for the CSID Gen4 hardware found on Kaanapali SoC.
>
> Introduce Gen4 resource descriptions and implement the hardware-specific
> register programming, reset sequence, and BUF_DONE interrupt handling.
>
> Gen4 splits RUP and AUP updates into separate registers and uses a SET
> register to commit the updates. Update the CSID interface to support
> both this scheme and the legacy combined reg_update mechanism.
>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen4.c b/drive=
rs/media/platform/qcom/camss/camss-csid-gen4.c
>> new file mode 100644
>> index 0000000000000..4ff2f41f70f7e
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
> [ ... ]
>> +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
>> +{
>> + /* Hardware clears the registers upon consuming the settings */
>> + csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
>> + csid->rup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
>> +}
>> +
>> +static void __csid_aup_update(struct csid_device *csid, int port_id)
>> +{
>> + csid->aup_update |=3D CSID_RUP_AUP_RDI(port_id);
>> + writel(csid->aup_update, csid->base + CSID_AUP_CMD);
>> +
>> + __csid_aup_rup_trigger(csid);
>> +}
>> +
>> +static void __csid_reg_update(struct csid_device *csid, int port_id)
>> +{
>> + csid->rup_update |=3D CSID_RUP_AUP_RDI(port_id);
>> + writel(csid->rup_update, csid->base + CSID_RUP_CMD);
>> +
>> + __csid_aup_rup_trigger(csid);
>> +}
>
> [Severity: High]
> Does this introduce a data race on csid->aup_update and csid->rup_update?
>
> If a stream is configured in process context via csid_set_stream(),
> __csid_aup_update() and __csid_reg_update() modify the shared state with
> non-atomic bitwise operations (|=3D).
>
> If an interrupt (such as RUP_DONE) fires concurrently for an already runn=
ing
> stream, csid_isr() will execute and call __csid_aup_rup_clear(), which mo=
difies
> the same variables using non-atomic bitwise clear operations (&=3D ~).
>
> Because these bitwise operations lack locking, could the interrupt's
> modifications be lost, causing the hardware to receive an invalid AUP/RUP
> command mask? This might lead to broken streaming when dynamically config=
uring
> multiple virtual channels.
>
Additional reply for this. As this relates to CAMSS arch so that a
separate series will take care this. Kaanapali series will continue
focusing on the platform enabling. Thanks.

Best Regards,
Hangxiang


On Tue, Sep 29, 2026 at 2:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] media: qcom/camss: data race on csid->aup_update and rup_update
> - [Medium] media: qcom/camss: integer underflow in __csid_configure_rx
> --
>
> commit 611abdeb4b5da574ae292d1ff736d0d71f2f4ed2
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> media: qcom: camss: csid: Add support for CSID Gen4
>
> Add support for the CSID Gen4 hardware found on Kaanapali SoC.
>
> Introduce Gen4 resource descriptions and implement the hardware-specific
> register programming, reset sequence, and BUF_DONE interrupt handling.
>
> Gen4 splits RUP and AUP updates into separate registers and uses a SET
> register to commit the updates. Update the CSID interface to support
> both this scheme and the legacy combined reg_update mechanism.
>
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen4.c b/driv=
ers/media/platform/qcom/camss/camss-csid-gen4.c
> > new file mode 100644
> > index 0000000000000..4ff2f41f70f7e
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
> [ ... ]
> > +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id=
)
> > +{
> > +     /* Hardware clears the registers upon consuming the settings */
> > +     csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> > +     csid->rup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> > +}
> > +
> > +static void __csid_aup_update(struct csid_device *csid, int port_id)
> > +{
> > +     csid->aup_update |=3D CSID_RUP_AUP_RDI(port_id);
> > +     writel(csid->aup_update, csid->base + CSID_AUP_CMD);
> > +
> > +     __csid_aup_rup_trigger(csid);
> > +}
> > +
> > +static void __csid_reg_update(struct csid_device *csid, int port_id)
> > +{
> > +     csid->rup_update |=3D CSID_RUP_AUP_RDI(port_id);
> > +     writel(csid->rup_update, csid->base + CSID_RUP_CMD);
> > +
> > +     __csid_aup_rup_trigger(csid);
> > +}
>
> [Severity: High]
> Does this introduce a data race on csid->aup_update and csid->rup_update?
>
> If a stream is configured in process context via csid_set_stream(),
> __csid_aup_update() and __csid_reg_update() modify the shared state with
> non-atomic bitwise operations (|=3D).
>
> If an interrupt (such as RUP_DONE) fires concurrently for an already runn=
ing
> stream, csid_isr() will execute and call __csid_aup_rup_clear(), which mo=
difies
> the same variables using non-atomic bitwise clear operations (&=3D ~).
>
> Because these bitwise operations lack locking, could the interrupt's
> modifications be lost, causing the hardware to receive an invalid AUP/RUP
> command mask? This might lead to broken streaming when dynamically config=
uring
> multiple virtual channels.
>
> > +
> > +static void __csid_configure_rx(struct csid_device *csid,
> > +                             struct csid_phy_config *phy)
> > +{
> > +     int val;
> > +
> > +     val =3D (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
> > +     val |=3D phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> > +     val |=3D (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
> > +            << CSI2_RX_CFG0_PHY_NUM_SEL;
> > +     writel(val, csid->base + CSID_CSI2_RX_CFG0);
>
> [Severity: Medium]
> Can this code underflow if phy->lane_cnt is 0?
>
> If the device tree incorrectly omits the data-lanes property, phy->lane_c=
nt can
> evaluate to 0.
>
> While __csid_configure_rdi_stream() provides a fallback for this scenario=
:
>
>     if (!lane_cnt)
>         lane_cnt =3D 4;
>
> __csid_configure_rx() omits this check. If phy->lane_cnt is 0,
> (phy->lane_cnt - 1) underflows to -1. This would result in writing 0xFFFF=
FFFF
> to CSID_CSI2_RX_CFG0, clobbering all its fields.
>
> Should there be a similar fallback or validation check here to prevent
> hardware misconfiguration?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-kaanapal=
i-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com?part=3D6
