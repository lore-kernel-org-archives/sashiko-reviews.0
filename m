Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795150812;
	b=jgjwCEg4wSRXPzz/W4/m7hgxqUgxL/tZZ/Q+InnBPrZ7wf7cMNUEASggOSb/I+SK0ObK
	 anrRi164h9zaOwZ0UW8FP/njTGJmzH46T77JjQOrstB1rZmIgZkS1ajWpmpHZiXpym3LK
	 fFw7xZarvRVwaVLYonCL49CY4cQSnmza7x12E0uQm8tOsgbZp6ZOB0DOeQS4mkYvM0Tk/
	 HnTNX1uzEhkwIL0Vh32Jg/24NImvwqedZ+nRvGx99OgH2yejV6X/6Sma3cMsr/Sk8f9NB
	 lltXszn0/afuKDdLTB8PnLv8U/bx8Pa8b9YdiuMJqWvKt7f+hF8xpsVewPU6V16Kstg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795150812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=qcKqx/660BDgHBKgHfBMjoLNxeFlmOefa7B0L19uKZE=;
	b=MlnDEssMF+F/gqX1C+4V4Oo+40AlLsPAIp1c9OfxfGuq5GI4DPUboFqwpTpuxFBogQTT
	 HVZ/a5zDve34iT/zKdCj6ZhUTwoMJpe/AqDxqGjbt0eJeqJWtbFCjk57vmAwpg7RhOfcv
	 1QwBtxej0xAnjy2TUJ34BLMb0nvyJrYdFKaa3pVWsCzjFmiqRnDolmOysEb5JS8VgvTAP
	 BEscYHrXVZXKOLmuk6LmrrYtgDfABpVPTOrllzUNKWWGlC6nZDjvPwADP3UHWFnbLJ0mC
	 Ja7fuGoh0rjdZMAvLS4tbcPdWm6LmK01sh5UiJhsdlnRnLqXodZ3b5EqS6NQrsM56HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgLK18yG;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627E1606A32A
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 05:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 627E1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgLK18yG
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso615135eec.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 21:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795150810; x=1795755610; darn=lists.linux.dev;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qcKqx/660BDgHBKgHfBMjoLNxeFlmOefa7B0L19uKZE=;
        b=hgLK18yGDy8546TD4I/2Y9iSQqu7GTrBrIVzuGwQUiehEhgb33ZFBbIPARUq9DH77R
         D1Rbb2/89ktPnGV630aUpgsQpxApu3sbVDzMY0YYZFLGgOVX1fdc1t6bIaPR39XcKSGu
         qGuHhqOikQ3l+zCxynZEdInspcu35fETftpIOAeLucp70xhwGA5HOenawzVZhf1Ck0fx
         VyeZySigAr9hhuIzPJ5lQ8BthaX5KzgNAhO/Sp5DbT3eDTkeSC9sZE7XUENcsIDY6Zk/
         fOGO7idrGG4m2U/LLSee/ylcsPaU0HAnG+SpCGOGgOfX1F6jK/VHZrOmQibm0Ufqmz4K
         0VYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795150810; x=1795755610;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcKqx/660BDgHBKgHfBMjoLNxeFlmOefa7B0L19uKZE=;
        b=1IA00B3XxN1zzeIHujftOQI8KZy3fmKMsRCZHJBWGLpv5b+DIPebY0OWDEx0iCYrHL
         Uv54voWOYBb9yyMs/tGoiLIoceBdwh79w7Sj/muosPbPmeJ1XLX9IzIyOiyGWTg4m1+G
         4uI8a+50x5pA7VLNIUle/2O+rOswis9oL5WzQ2Fziu8XW/o5S2MqFx6pS4vDacqfVKF7
         zjE+lwuEMPzkT8eVLZWjCzpDs01RN3FhWWeSI42qx0YuYWYy8Yx/CK7xoY+K5/yy8xpf
         Na/PELMNUdt3e7focVtRZNJpw8IZw1tOrwubGJ3jkFffg5TnqmBGj3wOShSKodFA3/6w
         +piA==
X-Gm-Message-State: APuU4Z/IGEnJx6a6rK2QNU4XBkg7K9U5Tua0sJ+brfe2cAWxiuedeowr
	5mziuKjZKHWtGU33yVCSJ7PDfcJ4Mn40xynOH9ja2LNPWX6666v+qjoLsLF1n+NBGMY=
X-Gm-Gg: AZFdTZeNYQCTLLkXqZPgD5vJ7ViqFa3TAWJXzgvjNSLZXQKEeIlFVVb1HTumB2CC+Tw
	8CfinDwtQWibmp8jbqqK+KVX3lJTV+TiM2ElThqhsnQXD2C4hjG6RLzmbEjKp5Bsc6W7BCIBVFT
	ObOJ0S1AHQy4GLBK08i6Y5J7ErvTGGyVzwKttY7+BbQlu6wkkJ4KDPZFwYHhwkIVtmcdih59Gse
	LthPyzva1DCfTEJkB4klPC80Gy51+A5Z3cXru9je1kogo/NHZvNQjP67kXoFgReICMpd5Ep9H+N
	mRzPW7wJPv2PkXCl0pfte+6H43wxgTBxmVMYK1g90gKqn3wmKjUCwz9sr0JOCwimUJ1OvBbIddD
	7Qg2nIOAJG7KxjojoLblLgmHnsxYV9hk9JneRE6KR9yAZnjc58MYT7R8BnL9xWseGcybnzo/nJx
	F3gtokwWkuuhyM4TVMngdP5MvRRuv2EZutdEF0OGR4BV3eN9EXDsvHx9W04ioXrwWrw+TmPGPvz
	naoQ/APXWh8lgQpStgdKdaruO7Vcxox2mVhEDe9eRZnPfc+yvzIvpPZxSYOh04BNFPTnGPjCYwp
	v3dZcJsGlbCdPfR/ABXezk6tspEZNIS6H2mfWSbGgCpYM1T4VIEoXn3MAfSUk1efQcMxRoda4Cw
	Cooy7tJjdvXE=
X-Received: by 2002:a05:693c:88c8:10b0:385:4637:5d92 with SMTP id 5a478bee46e88-3856f65de0fmr1475681eec.11.1795150809773;
        Thu, 19 Nov 2026 21:00:09 -0800 (PST)
Received: from DESKTOP-7QP7L26 ([45.190.211.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm4409841eec.10.2026.11.19.21.00.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:00:09 -0800 (PST)
Date: Fri, 20 Nov 2026 02:00:04 -0300 (Hora oficial do Brasil)
From: dev12124 <joaoanandalima@gmail.com>
To: sashiko-reviews@lists.linux.dev
cc: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org, 
    Ard Biesheuvel <ardb@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v4 06/19] efi/libstub: arm: Size the decompressed kernel
 allocation precisely
In-Reply-To: <sashiko-outbox-221779@kernel.org>
Message-ID: <0c221d69-fb50-e266-6054-7ce6360fd677@gmail.com>
References: <20261118182105.1633603-21-ardb+git@google.com> <20261118182105.1633603-27-ardb+git@google.com> <sashiko-outbox-221779@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3760872-206-1795150809=:13716"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3760872-206-1795150809=:13716
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

Hi Sashiko-bot, Ard,

A few points in arm32-stub.c in your patch:

>> ...
>> ...
>> + extern u32 input_data_end[] __aligned(1);
>> ...
>> ...
>> + unsigned long kernel_memsize = ...
>> ...

I agree with Sashiko Bot Review. In my current tree, I verified:

In vmlinux.lds.S:

.piggydata : {
    (.piggydata)
    __piggy_size_addr = . - 4;
}
  ...
  . = ALIGN(4);
  _etext = .;

In misc.c:

...
 	ret = do_decompress(input_data, input_data_end - input_data,
 		            output_data, error);
         if (ret)
 		error("decompressor returned an error");
 	else
 		putstr(" done, booting the kernel.\n");
...

In arm32-stub.c:

...
efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
 				 unsigned long *reserve_addr,
 				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle)

 	const int slack = TEXT_OFFSET - 5 * PAGE_SIZE;
 	int alloc_size = MAX_UNCOMP_KERNEL_SIZE + EFI_PHYS_ALIGN;
 	unsigned long alloc_base, kernel_base;
 	efi_status_t status;
...

I. Analysis

    input_data_end sits immediately after .piggydata and right before . = ALIGN(4); in vmlinux.lds.S, so its address is only 1-byte aligned.

    Applying __aligned(1) to extern u32 input_data_end[] does not prevent an unaligned 32-bit word load when input_data_end[-1] decays to
      u32 *, which can trigger an alignment fault on ARM32 during early  stub execution.

II. Suggestion

    Declare extern u8 input_data_end[]; (byte array, naturally 1-byte aligned without attributes) and read the uncompressed size safely
       via get_unaligned_le32(input_data_end - 4) (from <linux/unaligned.h>).

Thanks,
João Guilherme da Silva Freitas Lima <joaoanandalima@gmail.com>
--3760872-206-1795150809=:13716--
