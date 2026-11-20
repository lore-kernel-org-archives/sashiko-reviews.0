Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170425;
	b=h0NR9dmlGFIPOguEoKqfx03UFMOE20hPBGd8wT/WOaDArMtjbIJhz0nNEcycUwYjzmoM
	 Y0gYp8Ox6uEvUyg2Q8A3YjyK8DSty8LDFsJVIHF5xDxzVEajFsgoWeRlQ1loHAW0Ud5OK
	 iATN4NVJBBnw0tmPLPWtdmITxpXkz0h6CoxNTr5N/fASIC08Qc3Qt6bU884SQkIHJHS+i
	 sea4KwP/gGO0f60soJK6cx48Ij2JCZxtXNCm8MZfl91GZy2GmVd1d+3MeRn5WHj3McBt5
	 sELHa5npFkJ/EcDOoVHR6/vvvjweWtRQfFdf+EJEPfTLNdj+YmcmBM3Cw398Iip0J/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170425;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sqtvpGfRA5LrlR7FglzvD5iPxlTRXGw7iSiBMQnMByw=;
	b=NPinAjC4iqmPXj5chsc6Pl09jXmNPH4WjuyU/ZAD65D6eXngQ+AKPD1cwyXoExQSm2cG
	 /fEkHNYdJ4HulZDYQVtTnIjyoyMEya9KMfJrr3+8kKqzBxBEqGvS19PnsWXIOTPYOhVWE
	 bka762bXPhApq1SkLZn8DpONIUEfczA3LkxT6/RYoR/nmNRixJt7xgr6ICg0aQAFHtm1g
	 d9HOKXfIUR3KOgv4XwrWZi0+0yhk/NY8+tLK92MBj0EaMhbbeHinhv2GR+Q+GVJHTz3jM
	 ysY9dg3QTNrv2q4OT3q2H2c7suys2NY7iBDzbYHbNDwLGzHDcGyI+wxRLROgbMQoJlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=ZkPJJklP;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=AwFEZEZ2;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1234606A330
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 10:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1234606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=ZkPJJklP;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=AwFEZEZ2
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4CF9C7A0380
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 05:27:04 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 20 Nov 2026 05:27:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1795170423; x=1795256823; bh=sqtvpGfRA5
	LrlR7FglzvD5iPxlTRXGw7iSiBMQnMByw=; b=ZkPJJklPphaoemP8OHUXLCd+Zw
	UEHwHOB3YQuNvcxe7b+xyKuOTHc1xvOk26vBwIDPGUZRDH6G6CEa3EZMPZ2BUUHi
	F5HZd/Oz0HDkNKb+h9N0jVesrJBt4b6Jrn4nKZXwIUkNte/D5rKRnRUzMc/S2kOl
	y73TZisPlMOjmI9Vt6NGBvpNbxe7wFg7V5x80ZHGToyePh0w5xLK3DA/b5SHfd+N
	5Bgd55TEsIgcfr4czPe8pT39PkWDTRypxvscsidjfY+AstcS3JTvisTb4dGiSWb1
	Y0GGnmfXA6BDkPqaGqIF9bRbEJlo7uOGVCmLmDYIIMK4GR4uoTq8w/K/F5KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795170423; x=1795256823; bh=sqtvpGfRA5LrlR7FglzvD5iPxlTRXGw7iSi
	BMQnMByw=; b=AwFEZEZ2LzLMm7PSFoU+fZFe+yWWW6hPiuVmNIPDP5bP4BxZkXQ
	An6T2ZoweBG+yGIMhaQ7r08tUyRmyqacfQl40bFA5zP8Vz+isk2YkaG+pkPI381a
	wWyinqMMaiIOwWmoek5M2vE8sUpnJKn+IhZRfUOlZpJhHXNSmOZMjjmTk2AtfaCA
	tBozIS90t9Uq/2SCrAh6zA8ZUBBsqR/sLDezLZF+z3F7ItDyV1VXQyR5KpdwfIf1
	lROpstTC8pPfzaraatBlU4roszp/RmaXyEzpDMop3DSxlKvwYpTD4JBy5GeA+2Fc
	dtSai45czd6t1i4ohk1RxQbMzLFdB665nhQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795170423; d=kroah.com;
	mf=PGdyZWdAa3JvYWguY29tPg==;
	rt=PHNhc2hpa28tcmV2aWV3c0BsaXN0cy5saW51eC5kZXY+;
	s=fm3:rsa-sha256:fAF9FzF46vTx9DcAy2VbQXC+D6G6ULgEPIpjt5fNHsFDaka
	lgbduz6V+Jjzo5/nNImc7uF4JPK2hx84TM1SnALbyziVLKPR1g9zllMw8J5Q3F6X
	+TUa2WQ5WKMX3azD37VnC+SgCHFGuH6Bv0IFEAjG+7NPF5phagi+4YCASPVy3G/D
	+u25lbPCpkbOGvVpPjhwIY7ckx8hcrkI5KdAkGQ3bxidk+nOERFEpGSowXHsDGqt
	H1JagWe6hhShJsDPAauqzG9RKMVctCQ5md1JBEBLHLCqNAWoEwEU0wS61lwahNYO
	uL2MLd+aO2pz+XFKHID9UhsHXva+93DkKHs91+w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:BebwPQmHYVEegXjc6hjMYvUNtjWewRwBzJu8gWTOpko=:5yHZwQOF2d4XcethyBIPk1L6TpLA/kYqKZ9KunJ07iI=;
X-ME-Sender: <xms:dyAAa6xeWuaAWGFD1JiIXCpPfHjEjX0IaX5PODum9JT4DYTcQfKFXw>
    <xme:dyAAa4jb5rLeyll8XFksCTpB-FGFIeH-o97DF49Dp9Tkyb37C8EshR23k0X-R0cU4
    ykL9Or_jDlep9SPzctu27xBz2NHCLXAoTEUN7bCw5StVr2-qsk>
X-ME-Received: <xmr:dyAAa-mEK9ISi-4AalReRx1jtqE7CSeCIyz2lbk6BhCJ8H2TBQnIsUr7p0JN8ydJT2GDfqIuVn3z4U0JTJsb0z6sM5gGJNtjuYFKmzTZAVc>
X-ME-Proxy-Cause: dmFkZTGyUuU3Ufzythcaao9OzcyT8m5XBwO/0kVQLdA/GepU7ksrYgrE0xlPHc7MHjLVI2
    82xnpAJgLU4ucyk6yJZ7+AIXKnhBolgfQfZ9heLwg7hnKu0rSk0SNJkGFoc8TGmCoa5QtC
    R8Y6h5Av73LH/uxNQ+RdLmp7i1H/nQpRnYfs8afy+VXBbWNdRUyccaCPoHcdi/SEaAUVlw
    /vWB8Xs8QHCwf2IioW1FWF0DYa0ltQ2TRxZ8jb3kiFbei1ZtgiqtnagjMMyIGiZrGlXbQP
    XhjF/Q6KEu2k0AFq53SA0TM1nW8H64YD4q0E/iC4RQz3ersMrxhtC5AYGozVknN41NAGF/
    DrEAS/+3IAxBzZEOBg22LqOBLKDLSu0ehRKhQLPGKsogY3fcLrDwozNYjyxw7TwmxRu6Si
    lSb+0Ir7prcA39/i7SqMcRjqbbzqt1MJyiumLoRMUvTEeVOHR89EBZDV6rWF+mmHy/YZTf
    sCGd+SolN6mrlUSWW0oHtkF1nc2SY694NcycOUFhEH+28nWa0l4rzrQjQ0MERBmRoRgx/T
    2kfqkQhGs5QBrwKRA5ktHCkvf9tnY/PklGSVTH/FpWVjV91xYCh0i35E7UQu6dhKDJdh0/
    Q4iUAaVw+lWck5nFoidLp6n9QGXHBj6d0Mtx/cz3M+jIfGuuSy0fYgrxl38Q
X-ME-Proxy: <xmx:dyAAa2hbbLkXrQbXvOhW5iK9Nev8aAHqZYEDACbTXgxXYPh1JLtU9g>
    <xmx:dyAAa60v1wjMTqm-mHZbwgi_1gVa8I7a8MtX-nR2dgIPmgCb9-uGpw>
    <xmx:dyAAa3IaPmQBQ77SQD7nUboFkec--XDcYod_tccrnU0kNgB93o9lvw>
    <xmx:dyAAaywKJitlNFLDXC5lYPtt_1mXNN3uEikdghD8oC2K5RlnJQ4lsw>
    <xmx:dyAAayybZ44Xbdev3vqSqBdPzJTjul3UlfwOcpwIRMA2WtsHBgGIpfYa>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 05:27:02 -0500 (EST)
Date: Fri, 20 Nov 2026 11:27:00 +0100
From: Greg KH <greg@kroah.com>
To: Chengyu Liu <lui2012qwq@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/4] usb: musb: cancel irq_work after masking interrupts
 in musb_remove()
Message-ID: <2026112046-trash-blot-dd55@gregkh>
References: <20261112160448.41566-1-lui2012qwq@gmail.com>
 <20261112160448.41566-2-lui2012qwq@gmail.com>
 <sashiko-outbox-211493@kernel.org>
 <CAE=Q7=4PdubbUYnNwcVHg1kbChe5ukOxD_uj8ee3+J7sW5OhUg@mail.gmail.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE=Q7=4PdubbUYnNwcVHg1kbChe5ukOxD_uj8ee3+J7sW5OhUg@mail.gmail.com>

On Fri, Nov 13, 2026 at 12:33:48AM +0800, Chengyu Liu wrote:
> Thanks, f730f205cc51 is the right one. I'll carry the corrected Fixes
> tag if the series needs a respin.
> 

Yes please fix.

Also properly quote your emails, there is no context here at all.

greg k-h
