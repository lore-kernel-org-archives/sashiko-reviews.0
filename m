Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796274;
	b=yL+8Wj1r6MA9kuYl3PI2n6Ekn5iwgFJqszHVP+HffXNl0drGndcYSxSiZKKoAhgr2h9N
	 2KUTK6ECxqnLrFJvjf/jeZhBr1jzQgIUSG+1qlQz8aImGavzSkq3Rd3yk/Yrnz78bHkiD
	 Z8k7qIwR+qdFet5vzeMfZqseAsgv22pcod9cp4GdydN8boyFrXbhN/Y1bxSU4cddx1Jhy
	 FXn1WrtaWAs2Cbqe0rYJTmheaib9E2kuFbdbggYSY/lzsFMbNSrFNP9Zm9yfwv4MJHYOm
	 4oAx71xcZvPPa53uLBxKXK+NlWhdTsD9DT2G6qOyifE/vs/VcbrdaIBiSAFAhXrwJ0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Content-Disposition;
	bh=M/kpY+kx4cXKju3wCspeQj86Yh+9+P+FTV3zEb/PvMQ=;
	b=VJtOJ28nzYeA4v0iDwSJx3DWz/tG2Ylb/YG4cWV9IQ3VMcKrUCS988qW0/lSSOavcepC
	 inuwf8zL0eACwV0vXvlY7Nu2TO0R+i9yrr6MbV9Lh+2X7cmumkd3ZMJeX5nYBkcD/3QVK
	 YZ3cXA4ThJqC/pFo1T0FZPeNN3SvAoFShZM5dzapv0/9Yae7yFxNukVXQENF4CVL+vJu3
	 bjsBPday2/LSx2hkz3UjrzK3IWn5CUTvQGtb9wxTlOXLhrBdfIlFUqbVBFCf4v6jUfGCA
	 X/wB0PYdQPgKlkjFBetHcUBFNDSSLL0c77vqKAQf7FOPwtAUqaXqf7/GhngK91g96Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fwZz2u/c";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EF0606A31F
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 02:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58EF0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fwZz2u/c
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37198ed3727so4496537eec.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 18:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794796273; x=1795401073; darn=lists.linux.dev;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M/kpY+kx4cXKju3wCspeQj86Yh+9+P+FTV3zEb/PvMQ=;
        b=fwZz2u/c5kzajkPN93dHVZxJhYrtUna3TI66ZP3zIlgrpqiUkllYmyP5UPoH3yGUBe
         bI4q6n4Z01P3Q0j7cllDQNm6Kdb7l+eNppfNWyWtSh6YDNhL4Fv5kIhUvagCpPY46Wfs
         z8yXeHIFYN5HbzixOJ0MwSDJeVJ5rlO5meSc6D8CmrHdfSfi7/I5T/01j1lY5pOVPoSY
         hg/Sa3316odE4qv72vuW1WgAJuhKAlc3Drdry6F8IgG7U1vzUea5hAvBkozaby/JtjJf
         KvA/AzZ4gr8BR108LTa57hHKYat0SyNGozxehWZ8OpflGh+ejmZRQ1T8XI0VkIZ9Eb3R
         MKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796273; x=1795401073;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M/kpY+kx4cXKju3wCspeQj86Yh+9+P+FTV3zEb/PvMQ=;
        b=Wf+DG6k7KUuUwK+Yg4cYfQpFs0csZ1d5xkx2OeYm/GntPeuyalftp9pNIsHTLsP00g
         URuNUxGyliw/gTl1D8UJyvp09dxW4Psx8Kp+MUUQgNYXGzLIeYzJr8zX+IblGT1/K7nd
         LyXQ5Y3AyLkKvBZ6osBkU+nf0AF41G9rCtNyOuCOym4YC6R9/S69WtbQ7WDXO0ZdBnqc
         Gdl+NVsCS7aKIq4buOqow5YMx+o2nXJbUQIZ7avTcU6bYV/fE/ovj16zltsYmFaFVVQO
         eUg2khMxmk2VHA4AR7Br9JcQHxGf+VGiZtCVAawbyTteiEoOz9au2WdRu1F/cBaAtpVo
         KTfQ==
X-Gm-Message-State: APuU4Z+VkLCFicRnZpITgY7TY8CTG41y2y2AqXHS+XFfLDwloygWVztl
	zGLVir4KJk5yLbp9Kw/IRsY+6h1dzeZa6xgfbTW4zF5KMrQOU7HyIatEDT1xlw==
X-Gm-Gg: AYBFou1LtOifcN/NsEm1CDZYd0EvvgIDWJd6u+NrkBiNx7aRalhdHb13EI3weaka6MD
	EiIqvq6VJwr4JOQFgmWnxyavO5K/bzI8IeuTO2szIvHH+6tgygj+BWLP5Hv6A6/nUoqSMclEUjp
	V7J/fT2fXzP9Hw69wzrhLLhBMo39XMxEDcIzJxomOhg/Jnl3S56ReiB6zWvMMcO3AkdWaCF9zrB
	Vu0AG0s7LjgeaPg527RayeJpZxUXSQ1glVVKh3YduNAK2IuyP5h+1pVpZ5c3eOCjkeisbb7DCUa
	iHDeaj8mscRab34ESRAmqVuW/0FjPFfoLPLjbZJvlaVDnOfPB03DuD7xCVSnL23nHhk1i0KYThP
	wwuDcduoiMMSVr0UyS9T5vef/ToWDqkb43IdA2pwoCctbyTaylKkwj3a3NP9bacfp2jhckdbiVE
	e5c+zN7xpjcTClh4B6uvY84h9xEoGlTDf463AZFM3q+Ct2gTxh+SGOpkFivsCN1AKkWWaY+7HXz
	uggSMh8aBAc9h4u3w2qKZ7kpXVdQtKdYY5QW0RAMuyAKasJyqZfuTBaZJ+nbs9quxt0MXXQi1EQ
	iMZihSuY+FgLK7R/ur2q2k2xu91L0eSy7fcvtX7rch2PIppk4B8/TkmdI7c/tCCs+E+e
X-Received: by 2002:a05:701b:4301:b0:181:8948:f022 with SMTP id a92af1059eb24-1b5030cf278mr7558074c88.21.1794796273178;
        Sun, 15 Nov 2026 18:31:13 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:203f:d9b9:dda8:24e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b27dsm26762374c88.2.2026.11.15.18.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:31:12 -0800 (PST)
Date: Sun, 15 Nov 2026 18:31:11 -0800
Message-ID: <aef5b22471cedda012e99a7dc82c6a20@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 04/12] HID: rmi: fix device lifecycle, suspend, and reset work handling
In-Reply-To: <sashiko-outbox-214211@kernel.org>
References: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com> <20261113-hid-rmi-v1-4-afc43d97d766@gmail.com> <sashiko-outbox-214211@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Nov 14, 2026 at 06:21:03AM +0000, sashiko-bot@kernel.org wrote:
> > +	set_bit(RMI_SUSPENDED, &data->flags);
> > +	cancel_work_sync(&data->reset_work);
> > +
> 
> [Severity: Medium]
> Can rmi_event() still queue data->reset_work after cancel_work_sync() returns
> in rmi_suspend()?
> 
> Low-level HID transport drivers such as i2c-hid and usbhid invoke
> hid_driver_suspend() before disabling hardware interrupts or stopping input
> URBs, and without holding hdev->driver_input_lock:
...
> Neither rmi_reset_work() nor rmi_reset_attn_mode() checks RMI_SUSPENDED, so
> reset_work will issue bus transfers and reconfigure RMI functions concurrently
> with rmi_driver_suspend() or while the device is suspended.  Using
> disable_work_sync() in rmi_suspend() paired with enable_work() on error and in
> rmi_post_resume() would close this race.

Good point, using disable_work_sync() and enable_work() across suspend
and resume avoids the race with rmi_event() and also removes the need
for the RMI_SUSPENDED flag. I will update the patch accordingly.

> >  	/* Make sure the HID device is ready to receive events */
> >  	ret = hid_hw_open(hdev);
> >  	if (ret)
> > -		return ret;
> > +		goto out;
...
> > -out:
> >  	hid_hw_close(hdev);
> > +
> > +out:
> > +	clear_bit(RMI_SUSPENDED, &data->flags);
> >  	return ret;
> >  }
> 
> [Severity: Medium]
> Does jumping to out when hid_hw_open() fails leave data->rmi_irq disabled?
> 
> If hid_hw_open() returns an error (for example, -EINTR from
> mutex_lock_killable(&hdev->ll_open_lock)), jumping to out clears RMI_SUSPENDED
> without calling rmi_driver_resume().  Because rmi_suspend() disabled the
> transport interrupt via rmi_driver_suspend() -> rmi_disable_irq(), the device
> is left active after resume with data->rmi_irq permanently disabled, dropping
> all subsequent attention reports.

hid_hw_open() is required here so the low-level HID transport is open
to receive read data reports while rmi_reset_attn_mode() and
rmi_driver_resume() talk to the device. If hid_hw_open() fails we
cannot communicate with the hardware to resume RMI functions anyway,
though reset_work still needs to be re-enabled so the work disable
depth stays balanced across suspend and resume cycles. Beyond that,
RMI4 suspend and resume handling in the core and transport drivers
needs broader rework anyway, which will be addressed in follow-up
changes.

Thanks.

-- 
Dmitry
