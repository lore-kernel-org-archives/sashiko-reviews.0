Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ED0390229
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 23:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783553418; cv=pass; b=QcZav9/Ij5TAjC+AYADc7fn2bEzK2SwJo+pEh8z/xK+OCQoEB3RTtGpsoDPI/eV6+qtyNV2HvvWAEssX9nyq/IhatFB0zoy6ZTfN9aWnDdmMIdwxLKVLek5JhYC8IQULhk++aya8mkpKMkQ1o4CA6NFdPhYTRVUrck0TsXLiC+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783553418; c=relaxed/simple;
	bh=/fyP3KcmqC/8VrwPQbtBc7Uu9SQEKGfTToR5vjTVS3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OKT/2c96pHMFGiZ5OUiwFsLRsIPyH+OVFC7AZMMlIRwyw4fMk3/4FaDqVJReOfxqadJ98khthguv27+fFeGwONHL05OGc4327ZELNBXycRjdNyo1gqy4jTwRGPBvt+ayYjyoHJ9oAMKkUQYQBOmjMm6W957CXtnpqvNzjlXxHVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OdksKb9B; arc=pass smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OdksKb9B"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6a364f76a46so708960eaf.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 16:30:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783553416; cv=none;
        d=google.com; s=arc-20260327;
        b=GhMx+MPaNN+U8MpgxXQvelmVC20FHfV3saAZU2GYU77DXfefIuzpEE8b58VKQ13xnq
         k/MAznQcdpDmbnuIC1JBzPPBDFdJhYa49/pkQM1eYSkd8w0XO3jJDCU0s3KLLT0XiHBT
         kj/tC2/lNJTbn+RvwCw8orcjHj980jI+JkIJPS5gQ35ssNCS6WUtUZVlyhuKxiD8bXQT
         sJO1iISEFj5KmD0seOMNspG7EMJaU7jNlIMBceCPqmHkgNe6idoNbGyUtCRTqPzUvYDp
         oL+1lXBczgOhY1ZAdc+NUm1MvWoN11qtC523XAO+gvAfWBaQUi5yWqtx9KRT/sm/qPSf
         odug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Phac2raMjwWjIRCVv5WDyx21Xab89Vi8U4ckasYYSM=;
        fh=UUB3vW30XnC3liZtTp+vFjsgsVaYGxoFj5Zsq4JK1W8=;
        b=ioTkrianCBAL6uCVBSVZqrsWZh56UU+rpjxw5jV4jiizs+X8NwyrCWNQsbCxLP7y6o
         E0hiKa3uQOIUwTrN2Q2HNDizXTKrvukod6wrwelbz/F/hsj+N7rPwZmKDWvutTFSmI2g
         FXJHU0G4yWpDH/Z96OOeSBDRJeaSx69ZmbMJui5o+FLFuaisjEKd2ZkMBUeoEJzfjpJz
         Mpu8olDFnzzmZ3obYWaXGzutRyRfWc/UYLIbJVqiVNLeRUV5eOT0hmnylQuVVheUbztW
         IrdRgkHhJ7uHSsjmOK7327bxiFobXftFD1cObV2U1r/U9rt/mLUQYszdK7eBkT20IDBb
         WSGw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783553416; x=1784158216; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Phac2raMjwWjIRCVv5WDyx21Xab89Vi8U4ckasYYSM=;
        b=OdksKb9BiWVI8bSDkPF71wIOMAyIndn9i3rY/LB7l8LEQ+AHcb9jwZoJ89EeNQer+y
         /f7D1nT7sbO01ByuZhbpdjg0kEJXORrjYtBzdQzJiuWl07Nr2yxTYvnOG1OMHpwFLVJW
         awkSu3hrF/BgdB7OslYf7XhqVwi0zVsDYQzZYuFX0kvUfnUvAlSYi5gV9u19/M3xmtpl
         FWww7SqQBoPx2yuG8fPkI/Z8pzO5P5cy1QN2eBFQoVTqNdeBVW8KtKwiYAHhRNPJ5Jc7
         otp1t9KzoI7Om/KuYkaLV/fO1OnsBuUtY6lUhjBdnRIO4g3j1fH6NZLE46rwqsb9OREd
         h7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783553416; x=1784158216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Phac2raMjwWjIRCVv5WDyx21Xab89Vi8U4ckasYYSM=;
        b=sUdm13g5LXUBHqN+ctSXYnhepva6RVmQE1l2IOWXBxVLesspu0AVVSx+DXjA0xOMHu
         VPL7VcV4HO8nurkWFxHib03x4Ani66G+LjGBJXzu90Wb01sQNUYW7a6wqfrtb/7iEezU
         zg63CHMjuAu/THNaea68R95rgpfiRasPk3Phpw3YTRqFdMtQmy2Nrb5fkPhI81W2sBKh
         FblOWntgeAVUYd66qeX7sMTh10GQ7GBnhnxUVCifYbCDwuVTOI3PI7qL50JjR095IB3o
         MAy4bBh3tMwikgAk7sXvST2U+SLx5/tgJA7oYFqLEOEI2uRrrGdTfzANdZp39LF7oaf8
         MQ1g==
X-Gm-Message-State: AOJu0Yw58QKUkfUdf3W41qOQFqKlb0x5wR9vJ4ijCIQdTyZlNrwLmfC0
	KAlC+kTVQdZrwqwLjnJDFbXeBvyG98OtwNbyC/8bBJjjw47LM4iqDdNjc1ZgRS623h5CMlKR0mB
	0e/g7AgIDYcCGlX3Tfqz5cfWr77Gq6avvBuSrF3DrwPGDqu7fqTlmNJXSzSg=
X-Gm-Gg: AfdE7ckQJXGHcPwtBSY6cugrKI7XRVh2dvI6RSdbJLQ1zFiqBieZvnuYb0idQiwfoXa
	DsWFTAHKKyosdJX1E5ZlJCtVo4NuJHD5CcxTJvCB3rmu8INc8/FuJmwSqI9dv88wbCFrdIVvKEi
	Qiokg9arCaDpIWg9NWSW6M8xfpmHSsQ8ofSWASbaodAZtqCONW13YbMug+eZzjCM1s3HRaG9U+1
	vaQtz/AzexlNGMgms6/YQR8XEdxNnIMk4B4ba30h+LR+Xd1VXiLq1fwORq0lHwl1foSyUBzvGBT
	IOp32Z9LfmBDUZoWyud0+W7KDNuP3qUOg3HpSA==
X-Received: by 2002:a05:6820:2085:b0:6a3:1f3d:853f with SMTP id
 006d021491bc7-6a36da346b8mr3187577eaf.7.1783553415229; Wed, 08 Jul 2026
 16:30:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706231633.700676-2-rdbabiera@google.com> <20260706232735.9DAE51F000E9@smtp.kernel.org>
In-Reply-To: <20260706232735.9DAE51F000E9@smtp.kernel.org>
From: RD Babiera <rdbabiera@google.com>
Date: Wed, 8 Jul 2026 16:30:02 -0700
X-Gm-Features: AVVi8CcSrwCh5LbwO7WnfvTZrSFNdC4Sgt5jKz_3inEavnBPl5_6Ab3E641i0pQ
Message-ID: <CALzBnUHg9W0kAwN6kvv5888WAK+i3J5B9PBqqRYA6q5+tjm9KQ@mail.gmail.com>
Subject: Re: [PATCH v4] phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver
To: sashiko-reviews@lists.linux.dev
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, 
	neil.armstrong@linaro.org, Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 4:27=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> [Severity: High]
> This is a pre-existing issue, but does this function have a race conditio=
n
> with power management that could cause a bus fault?
>
> google_usb_set_orientation() checks pm_runtime_suspended(gphy->dev) witho=
ut
> holding a PM runtime reference. If the USB core releases its PM reference
> immediately after this check, the device could suspend and power off the =
PHY.
>
> The function would then acquire the lock and call set_vbus_valid() and
> program_tca_locked() on unclocked and unpowered MMIO registers, resulting
> in a synchronous external abort.
>
> Would it be safer to use pm_runtime_get_sync() to ensure the hardware
> remains active during these accesses?

I'll add a get_noresume call prior to checking runtime_suspended,
and then adding a put_autosuspend at the end of the set_orientation
call. If the suspended check fails, we can put_noidle here. This would
cover not programming vbus_valid when unnecessary, and addressing
any race condition if the runtime count drops to zero during the locked
section.

> [Severity: High]
> Can this lead to redundant TCA programming and a 2.5-second timeout?
>
> Looking at google_usb_set_orientation(), gphy->orientation is updated bef=
ore
> the mutex is acquired:
>
> google_usb_set_orientation() {
>         gphy->orientation =3D orientation;
>
>         if (pm_runtime_suspended(gphy->dev))
>                 return 0;
>
>         guard(mutex)(&gphy->phy_mutex);
>         ...
>
> If a Type-C plug event (Thread A) sets gphy->orientation but is preempted
> before taking the lock, and the USB core concurrently calls
> google_usb3_phy_power_on() (Thread B), Thread B will see the new
> orientation, program the TCA, and release the lock.
>
> When Thread A resumes, it will acquire the mutex, see COMBO_PHY_TCA_READY=
,
> and call program_tca_locked() a second time with the identical configurat=
ion.
> Since writing the same configuration to the TCA hardware doesn't trigger =
a
> new XA_ACT_EVT interrupt, wait_tca_xa_ack() will stall for its full timeo=
ut.
>
> Should the orientation update be moved inside the lock?

It should be moved inside the lock, but because if the orientation is
set to none, there can be a race condition where power_on passes the
orientation check and then proceeds to program the TCA when the orientation
is none. Setting the valid bit on the TCA_TCPC register starts a new XA_ACT=
_EVT
interrupt, so the stall here isn't possible.

Best,
RD
