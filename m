Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD9C322B87
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481787; cv=none; b=ITuztEOZXReFfKSf2xFcOX9h5cvQ4K+OsVTBNcpfhJLlkKoyN0jHIeOKwtxszgVHw7rSVfUCkNThkHBnzO+KeK0SgYIMO26tn5bJhaFBMEtGHLHjbQujUZtghjzaxJ7N6Dc02OJ9G28ZM8hf0FtP2v1trv4m4R/rwrBdh6Z3bwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481787; c=relaxed/simple;
	bh=RKekm+AFu0zQ9Yh8towhYyvvh2eUKNPAXjaHmvOm5CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6oEstXbea07UIzVHTyBjT3ASLKdWjQ5RTT/hGMMfvxYHy0899/13Qn+0/9AinxXyrSfv3D450RT8hRCzDH2jdNrE6MHFAjH3/CjBkBDShaokTK1uVvtdQLbxGL9y3/eUpN+7anxQbZ1o5aU88stAD58anYLwSw5W/p+HsLYIKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S17VJm/j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JW5BhgQS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S17VJm/j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JW5BhgQS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0Z8U2528390
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 14:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MHrobunLrDeqMOf9oCzOUdcm
	Z275jvdBL4rzPhn5+QY=; b=S17VJm/jv1LujChSdGN/KxHBBqQmWA0H5BAe2jGG
	itFibCQZZr+EIGnSAhuGpHF2u53xIS9YUVn6kIcauM0G29iBDMS6iQQorhVJnTYd
	dhF+Ci/vCDewdOeKrHJ9IsjoFg4t2uI6HHjGyFHaK8WbN9X6/hVASsCLDyKIufy0
	4E+DRQkWXkFOv1brz2RpmHIeyCQ1WQzynoJexCDl8hc11LEH3oW6I2/LFrcr/U5A
	8paKoLVg9V9mkYvPOn32RmIS93vuuP/4/e9iSCl4A7LdeHx0cw6lkz1dwjnbx57g
	G45VbI6nQng7I8kruYFUiP/NaWlUJCXaD4JbL7txPctUtw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qpa3jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 14:16:24 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-790376c9f8cso1110027137.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 07:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789481784; x=1790086584; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MHrobunLrDeqMOf9oCzOUdcmZ275jvdBL4rzPhn5+QY=;
        b=JW5BhgQSDOmXsERr3tTha1JF9UbZJnoghPHvT2kxXj24Z2xsmEtQaBAEVgYVxf5CkJ
         D4olGX73FlJueJzqv0lH/L6Ap4uPq20hcsxmD1bzPYpodgI41JjOVFT/EO5/W/Cb+Stg
         G8thJ5MX8ZyAbgv18aHGzUud/BYH1Wxelty91I6kQjCj3RY9zbBZ9yhcPZKyfD0UswMz
         LwV4IBzvPF1Zbq8SoAs0eKWeX7sMRpUvBZ8+/bxR7VxcopTfZV38gFbitclrYAQC1txt
         nQhBcyz7Nfl7kulWjE4Z5d+3khEppt4NU2izwCIPue1jkkPn+HileT8+CZvWWEYiOzYr
         NoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481784; x=1790086584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHrobunLrDeqMOf9oCzOUdcmZ275jvdBL4rzPhn5+QY=;
        b=MzHdTGH4umAX/YCvQmhBw3Y3z1F7PCy4CiQhmahGSZ+X6p/R9QPTXDYyUL9gMuctf+
         4Sxk3+EkCLrr9L1y4iKmLBg2bsofMcVD3gctfFgslFJwSGhL6+zGrXvxQHb0rZX9keeR
         ZheUGgvdVYgB/wSGg1oXskJx1mck+uIbU9jN4upPx3K7ZoO496SDuGZnJN0SbITdmtaT
         gjill8Dkpy7Ns9GBrhpa9FvusDDwplTe/3EbxuOPDUi3rFk5K2LFw0GCk4OtQBURyXqV
         3tWhcRBfUsYmLiL0jCp6TkjcJ1XzecxLLEpdp1IwAZ/XU9+BLcfEpOJx7FEuMAD65GX4
         MuWg==
X-Gm-Message-State: AFuF++lNpnjmisWXiR5mnahExNmfozQ1IDlKpXCyil6QclxjeF7VpXYR
	9HTISlbCzPkGFOlHCneVJiOizirgHLgTzmOhjymd0911MB6rsmBrInnqj2uJeArQr3pkrzRONsH
	46Fae7UiOe8u9oiNyOj4FdhBQOQt+b3GYHkhzv+WG6Pq2E1bXR1rS+r1pFjek0OwSqbSm7fdR9u
	7IeJs=
X-Gm-Gg: AYBFou3j6zUb10Vf0vBcuq+Qq4n+KaavbRBr/Azvub1IsIdvPwSgyijRF8cOPDGUH2T
	dTp+GkwZTchPwGuu9UQLoaxzVsmm0EBr8DgX7A+4zlJR+Q4T+lDyrlxM5QbXDNFOCt42wHaNZCR
	VRaNJFDrmKgD0PPy+Y88ugSxUIFW7oIKoWgeq/UVbJNIO7gEsVhgmgwN47CkN740bc21Mkj2KsW
	5YoDS5lZ3r3dD8n1x4UJvYtGaEnudIwa6xYFONeDA16qQpVlm7XVZYTngJL9B7KOb6Cj+BhR/eW
	3CzYABOaK7jjX9muizpOIm7oo5PlJDLucyEvT6CSjb22L9aTug1Bx9zbhyCLHYOCA27ONG4N53d
	UC0y62/TaRnLhtg==
X-Received: by 2002:a05:6102:149c:b0:791:8f69:b802 with SMTP id ada2fe7eead31-79b5992c78emr2744766137.7.1789481783528;
        Tue, 15 Sep 2026 07:16:23 -0700 (PDT)
X-Received: by 2002:a05:6102:149c:b0:791:8f69:b802 with SMTP id ada2fe7eead31-79b5992c78emr2744605137.7.1789481782643;
        Tue, 15 Sep 2026 07:16:22 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d69f6d6sm79254545e9.8.2026.09.15.07.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:16:21 -0700 (PDT)
Date: Tue, 15 Sep 2026 17:16:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-serial@vger.kernel.org
Subject: Re: [PATCH] serial: qcom-geni: Fix unbalanced runtime PM resume for
 no_console_suspend
Message-ID: <n7zytv2b5aspjq7q2qc5fevccfayd2py4udgg4r45pvt3hlk3w@hrcluyblqxx4>
References: <20260828-serial-qcom-geni-fix-unbalanced-rpm-resume-v1-1-af3e5aef17a6@oss.qualcomm.com>
 <20260828144307.79A7D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828144307.79A7D1F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIwNyBTYWx0ZWRfX4vZNDrCuBkZH
 UhS3iaqjQFL/TQv26TKFyJy0WRgdFHFNCyGy39LRtE7nNV01jlA/wizhcbTnhcNIZw2ygMWN6WU
 WdvjnIIE+r2raNSG1dNTwFiOVrvG0PU=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa95338 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fiUV_Yih_Ew7UUCE440A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: kOc6GCDdkpgTvUO657f7mg1q8GpZna-6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIwNyBTYWx0ZWRfXzGii4H970srk
 jE7Hl45g/5fDTG7Ot+G4uoCKwHHhub4wcZDCJcF5zkWfuWbElMGZTusp1PD/2LVbo5htF8kaUTd
 kNeWYDIQdGtkuHmjpJB1Ru4gP8SoBL9pc81jLfMZIC3AZpsqOkT5tB1rStOlkxNIuDfD9gIayZH
 I8cRMAG7x5hhNRSBXQYJhWVRPc4AUOAP9AJavRIwSGQDogl7ayJk6l9EF/F+hn1rMfW0S94CNvy
 /0jwLNuuiBbaMm61fHh/89fjbJPsEzhak3Bi0H6KmryjtTDTROQCbd6R7MZ2XQhvO6vytHdzYLg
 dU1S/hSEaVMzS7IxddThxCxsUnvEQrJ80d0PkVAj3rSFlwqzj6hja7Ii7t+ir/bZ6M5B1z0/ppq
 PWb5X+yMdXO2SXYKeZv/dVDUqJ2Wl01TYAGnxh32kHJrQROynS+586DYnojYa0eswi5W5audtA2
 Fw611F4TdJcgiTEYXtQ==
X-Proofpoint-GUID: kOc6GCDdkpgTvUO657f7mg1q8GpZna-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150207

On 26-08-28 14:43:07, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] Reallocating the DMA receive buffer in setup_fifos() frees the active DMA-mapped memory without unmapping it, leading to DMA use-after-free and massive out-of-bounds reads/writes.
> - [High] Asynchronous pm_runtime_put() is used on the probe error path before devres pm_runtime_disable(), leaving hardware powered on indefinitely.
> - [High] Missing rollback in qcom_geni_serial_suspend() if pm_runtime_force_suspend() fails, leaving the UART port permanently disabled.
> - [High] IDA line ID is freed before the UART port is unregistered, allowing a race condition with a concurrent probe.
> --
> 
> commit 7fc2859a848a4f1ec1c0bc7d7815a5c518730a33
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> serial: qcom-geni: Fix unbalanced runtime PM resume for no_console_suspend
> 
> When no_console_suspend is set for the serial console, the system
> suspend callback skips pm_runtime_force_suspend() to keep the console
> active. The resume callback still unconditionally calls
> pm_runtime_force_resume(), which triggers an "Unbalanced
> pm_runtime_enable!" warning.
> 
> > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > index 3633723acef8d..a180a00c9e23d 100644
> > --- a/drivers/tty/serial/qcom_geni_serial.c
> > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > @@ -1074,10 +1074,10 @@ static int setup_fifos(struct qcom_geni_serial_port *port)
> [ ... ]
> > 	if (port->rx_buf && (old_rx_fifo_depth != port->rx_fifo_depth) && port->rx_fifo_depth) {
> > 		/*
> > 		 * Use krealloc rather than krealloc_array because rx_buf is
> > 		 * accessed as 1 byte entries as well as 4 byte entries so it's
> > 		 * not necessarily an array.
> > 		 */
> > 		port->rx_buf = devm_krealloc(uport->dev, port->rx_buf,
> > 					     port->rx_fifo_depth * sizeof(u32),
> > 					     GFP_KERNEL);
> 
> [Severity: Critical]
> This is a pre-existing issue, but it looks like devm_krealloc() frees the
> original active DMA-mapped memory buffer here without updating
> port->rx_dma_addr or unmapping the original DMA mapping.
> 
> Could this allow the hardware DMA to write to the freed memory block, and
> cause handle_rx_uart() to later read out-of-bounds from the newly allocated,
> shrunk port->rx_buf, leaking kernel heap memory to the TTY layer?

Ack. Should be fixed separately.

> 
> > @@ -1991,7 +1991,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
> [ ... ]
> > 	ret = pm_runtime_resume_and_get(uport->dev);
> > 	if (ret < 0) {
> > 		dev_err(uport->dev, "Failed to resume and get %d\n", ret);
> > 		goto error;
> > 	}
> > 
> > 	ret = uart_add_one_port(drv, uport);
> > 	pm_runtime_put(uport->dev);
> > 	if (ret)
> > 		goto error;
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but doesn't using an asynchronous
> pm_runtime_put() here on the probe error path leave the hardware powered on
> indefinitely?
> 
> The devres pm_runtime_disable() that follows will cancel any pending
> asynchronous suspend work.

Ack. Should be fixed separately.

> 
> > @@ -2022,6 +2022,6 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
> [ ... ]
> > 	WRITE_ONCE(port->tx_kick_enabled, false);
> > 	irq_work_sync(&port->tx_kick);
> > 	dev_pm_clear_wake_irq(&pdev->dev);
> > 	device_init_wakeup(&pdev->dev, false);
> > 	ida_free(&port_ida, uport->line);
> > 	uart_remove_one_port(drv, &port->uport);
> 
> [Severity: High]
> This is a pre-existing issue, but is the IDA line ID prematurely freed here
> before the UART port is completely unregistered on the next line?
> 
> If a concurrent device probe allocates the just-freed IDA line ID while
> uart_remove_one_port() is still running for the old device, it seems this
> could cause a collision in the serial core due to duplicate line IDs being
> registered simultaneously.

Ack. Should be fixed separately.

> 
> > @@ -2086,10 +2086,10 @@ static int qcom_geni_serial_suspend(struct device *dev)
> [ ... ]
> > 	/*
> > 	 * When no_console_suspend is set the console must remain active
> > 	 * across system sleep, so skip the force suspend path.
> > 	 */
> > 	if (!console_suspend_enabled && uart_console(uport))
> > 		return 0;
> > 
> > 	return pm_runtime_force_suspend(dev);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but if pm_runtime_force_suspend()
> fails, does this return the error without reverting the effects of
> uart_suspend_port() and geni_icc_set_tag() executed earlier in the function?
> 
> It seems this could leave the UART port permanently disabled.

Ack. Should be fixed separately.
