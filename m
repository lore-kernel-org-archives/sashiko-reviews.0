Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871167;
	b=tw1SFaJo/a6dfNppEl/xsBxh1ggAQISHwuCHXkF5/FR3VpUflM57aHn6QN+Wgqxl/rsw
	 G0g+6ab4+JO3r5JLnTKufPkBViPefudHKWU4o5QnVq/YfImtMkspDvTZJx4S2/Udyeij3
	 Dp/37pR4qHI7ScIhVXxEM94sk3+D88bRZbldBgjprxhrxeYu/EqFvUl1ZwgO+PkCrE+Pg
	 R6BSytZGzlXncs/uTsL/+Os7hPkaiYR+1cpTg6rBEVW2xWFGZsy4sMOdceiQZudoA2KX1
	 DyYEmi9iQd9DLEodjRXiFJFdkTIXZ9l2noJq1KCnLM7slLB8jvP7bcmxEK5ItALmkfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=8iePJ2j9hYRhBFpXy6COEqiXeGRhguwoRsD0/kPxjro=;
	b=QPvfP9wsV/72n+gEDLoVGKZHd/r+NUKt9Nd3qzrFj3H0kUl5XwPmySdVBw892B79mzx5
	 1Xv7cUD8uiklSn2AE9H8y/6f7cRRzgKSf+BxkuBiqH/D5iH0xBzsijLkqx+EyZFvPsWm7
	 ttpYfQwU5shJ4Eun5smn8LJK56xhD2Q0ipcw5PCJofcZDJZdh5d5fQ+ReViyXbmk7MD3p
	 pXD8zpZtbW1nzs1wBo+R26Il7p+nn+sKm5kFZ2/2kO9FCdQ9s2q1MV4qX312Sm87pASHM
	 nV6Xs5wZeuNzmbO8F8iVSqFwxJMgl+ZpG6PfE3o/p9izIDN17J7rxFO0UihD3i/BCzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=JSPIBT8G;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7226E606A32C
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 23:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7226E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=JSPIBT8G
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14394530ec6so5071906c88.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 15:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794871166; x=1795475966; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8iePJ2j9hYRhBFpXy6COEqiXeGRhguwoRsD0/kPxjro=;
        b=JSPIBT8G6hdCHh5eWeE3oy/flXZB/GqMqp4hH00/vw/gZBASpmyHHtcKWfypI+QCIt
         u6gucqJYzr/XnYk5YdLIr6YBV3XGzYOhZVR5wEz/DUiQpm/SW1zavZMv7WWXV0FqBhD8
         +2iHmbRMJhA+REf7RuDen/yUwPagDpBWZLtXjL2y1/fw3yCeT53hUM22fPKbW7T/n2dr
         70Qh8Et6VnBP6EJRO8n/3dhIxlkVcdOoCLsk3+pG9i1cdgxtBhVJ3h+Z2XE4mxSPfUM6
         kJpRP4v/xXldKn6yU3SXNBVRDnGaAY5P5jP98ZL1VOpXh1eDggjiyHwT7e88bJHenKih
         FxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871166; x=1795475966;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8iePJ2j9hYRhBFpXy6COEqiXeGRhguwoRsD0/kPxjro=;
        b=LOJLvBSK3ROy/qqggDg9sG1IKDU0YNvP1rdmFhIWjugdcAUOSneK3r48y29tH5oTFH
         yUzvrKbCVKAWjo2c9zV7SulPwcV3fJ5mvxbGsMSV/7DR6xw029+8qE+icwL1wUCxOHl0
         KMNZC8iXvCJbbxDQxN8/5yJEU93B/QeJJeHqFYu9cCFo6Phad/tHGBIEtY+MTUESyo4g
         FpM3XKzQDacVM3hiFNqqnQyx5p9/SCFFc84Vz0YQSg1gbgtZ31fnVlDenzX7ztm2vdmQ
         vMpNTnly/gtDIu+alqbodSw1O1mYkr/duI36NRH3Z2qKFv3P2/TuAjTc+CXviLXiXnA4
         ZS5g==
X-Gm-Message-State: APuU4Z+wrklh4zZaji0jZVJD2W04UIhIQ/iLWlOgBsXePsUONp65qAvo
	e+yJYyAomkIrOZhxpcxlh853WRRVORUq7eUXReBxP6CJ0Tmze8jU18MnMisjpUsH4qPz+DtsoQP
	4WCx8s7yDQA9k5h1Rz4v7IpRJOYVb1grbkOlvVBeJUC4WnBpPDHnL5uIo0V3AZTvjFkgylZL15d
	FZfQLxn+QIWtk7MMpQj630b1t3p8WwvTacuOhXloMzSVwrCDxYqLvbvJfO/Iz8
X-Gm-Gg: AYBFou2BK0wtLr/HQJsqAsVIDEL6sEiZUFYzjTPXS8Mwv1q756eUjxtUqRmBYNJM6sU
	Gc7bsUH1PfVw+QTWc88c7eMOe3Em22E9s6EFUZchHauiM4HW5Ax0lKBwnDbfoaATKfExl/q5/yS
	27MXhpWGletFrGhVmKACJwbdnHmz0L0bSSOADsVuVBTya1c2DpiN9bIKKmzCexxnZCUweC2eQjQ
	OG4y/pklRN1gTMvbUbDmEy6yH0BIhGnfxxg5V8aRerjcEGO4RudgT2WHsEbIu3O9N4cO1z+sLOq
	iDQ4DQxO9/0ZlDOENkQt6uMmjKGRLLVMudK1ZqAcZiXFkESMa3Z/lhQwdHEFNRJIoilFI8pVWfA
	woLrCmkDqoiN79EEw/IbVOriTM2PMw4uYbL7sbhpe542a29u7ozUQ7hqXaxcAQ4fZnHLpyz+Np9
	OYRzzTUFeqtFKm8KuQCfQaL81QEhE1ibGXJyWTTTLXaTrhOgnieoUoK8WIxc5iqiQIzz2JsDT0c
	waN/EuocCvOJ9dP9mgMK6vVUhO3PQG2dmNkd3p330vbNBCM9h0T6Dt3BCrLnoSSHrQIMfSnnCpU
	swtRm5c/W/gCt01JqPrD3c13qDzcvDWXlcS/XRksqFD4pQd4UQ==
X-Received: by 2002:a05:7023:a89:b0:1b2:4da6:bccd with SMTP id a92af1059eb24-1b50312b2f7mr13094928c88.34.1794871165920;
        Mon, 16 Nov 2026 15:19:25 -0800 (PST)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50319d40asm36020092c88.11.2026.11.16.15.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:25 -0800 (PST)
Date: Mon, 16 Nov 2026 15:19:24 -0800
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
Subject: Re: [PATCH v7 02/17] nvmet/debugfs: Export controller CIU and CIRN
 via debugfs
Message-ID: <20261116231924.GB1670230-mkhalfella@purestorage.com>
References: <20261114030454.2836543-1-mkhalfella@purestorage.com>
 <20261114030454.2836543-3-mkhalfella@purestorage.com>
 <sashiko-outbox-214069@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-214069@kernel.org>

On Sat 2026-11-14 03:12:01 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] nvmet: torn 64-bit read of ctrl->cirn in
>   nvmet_ctrl_instance_cirn_show()
> --
> 
> commit 70231338c7dc52cc534009767cd7997ab988025e
> Author: Mohamed Khalfella <mkhalfella@purestorage.com>
> 
> nvmet/debugfs: Export controller CIU and CIRN via debugfs
> 
> This commit exports a target controller's CIU and CIRN fields as debugfs
> attributes under the controller's debugfs directory.
> 
> > diff --git a/drivers/nvme/target/debugfs.c b/drivers/nvme/target/debugfs.c
> > index e85fe1d4c9f8d..221fa81e124fe 100644
> > --- a/drivers/nvme/target/debugfs.c
> > +++ b/drivers/nvme/target/debugfs.c
> > @@ -153,6 +153,24 @@ static int nvmet_ctrl_tls_concat_show(struct seq_file *m, void *p)
> >  NVMET_DEBUGFS_ATTR(nvmet_ctrl_tls_concat);
> >  #endif
> >  
> > +static int nvmet_ctrl_instance_ciu_show(struct seq_file *m, void *p)
> > +{
> > +	struct nvmet_ctrl *ctrl = m->private;
> > +
> > +	seq_printf(m, "%02x\n", ctrl->ciu);
> > +	return 0;
> > +}
> > +NVMET_DEBUGFS_ATTR(nvmet_ctrl_instance_ciu);
> > +
> > +static int nvmet_ctrl_instance_cirn_show(struct seq_file *m, void *p)
> > +{
> > +	struct nvmet_ctrl *ctrl = m->private;
> > +
> > +	seq_printf(m, "%016llx\n", ctrl->cirn);
> > +	return 0;
> > +}
> > +NVMET_DEBUGFS_ATTR(nvmet_ctrl_instance_cirn);
> 
> [Severity: Low]
> Can nvmet_ctrl_instance_cirn_show() observe a torn 64-bit read of
> ctrl->cirn on 32-bit architectures?
> 
> nvmet_alloc_ctrl() calls nvmet_debugfs_ctrl_setup() before the host
> enables the controller, and nvmet_update_cc() -> nvmet_start_ctrl() later
> writes a new 64-bit value to ctrl->cirn under ctrl->lock whenever the
> controller is enabled or re-enabled.  Reading ctrl->cirn without holding
> ctrl->lock races with that update and can report a corrupted mix of the
> old and new values to userspace.

Not worth it IMO. I will keep the code at it is. If we are considering a
race with a controller that is becoming ready, then the value will
change and old values are stale because CIRN and CIU are random
variables.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261114030454.2836543-1-mkhalfella@purestorage.com?part=2
