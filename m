Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793578609;
	b=iEDYGu64N8axEikS8RovTmNwMNm22uaqJxfYiTB4ZnnhhpB/STZVsw0RuUZ9Ww0cVaXo
	 YAxmkkq1eSDTKI52EsPQ9vwFEF20U3HStCejJo2CXIp1A5Ng370Ca5QJIG58ItU0wLh1T
	 mwlQ79al+6MJXp/B0idiqAvB4hIYmkDO2AJH3nabonTVHUBvpeTa5SAwY//bL03DpnUQZ
	 +B2IIreSpLxDihwvthByFC2w8ozNpMR1t9LrshOo3Eby8IJFSVIkVaFm9JF5begd/86Pc
	 jPjohnHvZSupQQ/VRYayl6ulxZW24Q3+jRgvUfD1eSGhGZvdTjiRZf/2tJ8f22/iKaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793578609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=mozC9xUwsBeOwQ4lriF7JYk3bRm59v0HIYqRgo2OnDk=;
	b=FQ4mXZvXhdUYKA2Iw0LCDLdIiCkoFWBpJzmEfWLlLv2b3DmhW4w2awPqGmDPxetGOCyy
	 JeWx2Yk+mUf8fDFU6E8J2/rer+iwqO1tLIP0i7B67yASKnoTXAiSlQyXvpSTax1E5JbK/
	 FTPa1GEh8WDLRA0ovifeK/RmISiFdpCHepbfloz1O/34yTzIJruRyGkCtHCnZKl8iRnWo
	 taRBJewBtz/1dLNkgZZfq9Jj6MJKby3aIz+YTZKlRjnFXkq7cZbiVm1uXyGuJdN+m4dpy
	 GYQTRcDzloLW6Euf1UzaHZ466gUaHi5el5KMmb2n0ChaTwHv5ucLZ35/2BXgK3BTj/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bivwVBUs;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105AA606A327
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 00:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 105AA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bivwVBUs
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso24535a12.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 01 Nov 2026 16:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793578608; x=1794183408; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mozC9xUwsBeOwQ4lriF7JYk3bRm59v0HIYqRgo2OnDk=;
        b=bivwVBUsr/FAtKBQ8Oltopc7iZ4JTYu/Mx/6mlP/+JrDW2g9YFcXVzKbiyxdS+Aclz
         u2RbFjs+cjnwq02XUSgIzCEET5O6eRUm4LLMvjBAQkWuNasIDLY2XipkfbSMhY3B2AwJ
         Guq+BQyALIJjEhP2R44+REEikmpvjlyJOXmUtUhRg/Ugnytp3sagacxi+0H5jtdbU+9F
         /ik1S5vzr6faaCJNUDV4xmYHJO/NqhmACfgE5bjczZoSECirURCWDTvHXkxbxxRrvpIE
         3WrlsDspjXgk83eUW7ai+E01jm7srCVzWtejmhruNoLcVoIYXKKHU19/0mkenpScMkBS
         pusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793578608; x=1794183408;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mozC9xUwsBeOwQ4lriF7JYk3bRm59v0HIYqRgo2OnDk=;
        b=myRvRX7UPmM0q4eGKwRbEg7TyfD0YqS+h1qVmri6dxRiuggF0xgC8YFPs2yeiA0ZoY
         GmIjDfk1k7cpXFyu7N6iUbNaqSo9uPMcyNCmeMRIK6KXpJsH/STYneCeQZZaHEmPMMKH
         UHqXVHLBvC3QKg1PTFDCndIhbts2eBYZwW6ME+R79CySJxgqKNFVCWc6M5IwBZZqGFem
         N6sG9Vsr8MV9JWR9hBhf4YoGwajxNf+qx1F2gxOfVYLF3SjTIprXhASkxF7aUQaVumU/
         MgKKVOnVVbMM3UeWB6ZSSY+fazOC0cE4BXjW73iCuMeAW1+z2xSMYuGyJ1UNve+Yu4gq
         5Q7w==
X-Gm-Message-State: APuU4Z+zwAbl5z4N8+PBlN1rOmfehGsaubYnBIRAq3a7P4NDgSU7P58P
	ibPf/CTSAWpTzsv/Elf8v0+ZsBzuEHgXb+w8TnRcZhrrwCMxtvmju9CQBfmiCA==
X-Gm-Gg: AYBFou1UwDm3aYK7VO3okzyI+lRv1VnjjwsXUp9aMi/Jd01+OyX/gGfA2/0SteBD5fe
	hqTq60mKPOyxGi4N99ng6gnix7UW1DDIXonNPhloal+YnQTsjTN8T2CVd2zzeSVpKUymj+gkMwp
	R9ZxghUa8HNBjEAYYYo+TYvnqSLc8Uwqd+S3nj5ZEmqc2AIy4767ffhlivISyBVzoXvlyTpM/7Z
	yUqEUr8pa4ueEo75h+mTVitNgbM3FsRPRBqhJ2gV1jwXfrILfgLoaUX09zIXL/MIDPRDetDpG6Z
	TVnm5leTzDxDZ/cjuzkZwqKTcDX2iIMWw09V/MMWPU7hElJ9Ikj+iFGfZKoiLsO/sfK/0xugk2G
	NOs5s+HfPJ9n5lbfSq/JHiQeR9yzFEIK08Lp6+VMpmauCQRWn7Jp4vh0uTBveEtih6Eyr75xhTr
	8zgn+k5LvYqsIY07flXLfQq1ZkNikh7PL/bl6HuEvs4QsAc7TVgB4hoVDusH97nnIRJ2oJiMUJs
	TJNI2rAdLWIDJ5AEHNnmQwM6s1ZT2qD9x8U6W9OPbFZvxtpw+MGiJtvKRvZ1zL0wxykjQ/y1i/8
	UpCjkPuCoDF7wqu11tMyKgSXTkY9mqzkhtJt+qFRXhgl963CEjFACoPL2JCoP8zblZeIXZSJQ13
	Z0+NcDSv2Ar0mAkVD7520Vqw8ArZC9ztQxoU=
X-Received: by 2002:a17:90a:e70c:b0:3ad:a232:4044 with SMTP id 98e67ed59e1d1-3ae8979969fmr6431543a91.38.1793578608316;
        Sun, 01 Nov 2026 16:16:48 -0800 (PST)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f3e087sm6950889a91.1.2026.11.01.16.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 16:16:47 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 00:16:47 +0000
Message-Id: <DMKAJXEISH7G.1I34WXM92FRMI@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
Cc: <mptcp@lists.linux.dev>
Subject: Re: [PATCH bpf 03/15] bpf, sockmap: Don't let an SK_PASS verdict
 cover the next message
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <sashiko-outbox-192629@kernel.org>
References: <20261101192057.2296489-1-alexei.starovoitov@gmail.com> <20261101192057.2296489-4-alexei.starovoitov@gmail.com> <sashiko-outbox-192629@kernel.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Sun, Nov 01, 2026 at 11:42 AM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>>  		if (unlikely(ret)) {
>> +			/* A part of it may have gone out */
>> +			sk_msg_apply_bytes(psock, origsize - msg->sg.size);
>>  			*copied -= sk_msg_free(sk, msg);
>>  			break;
>>  		}
>
> Wouldn't Thread A subtract its own sent bytes from Thread B's
> psock->apply_bytes, and if psock->apply_bytes is 0 when ret == 0, reset
> Thread B's psock->eval to __SK_NONE and drop Thread B's psock->sk_redir?

Not a bug. eval, apply_bytes and sk_redir belong to the socket, not to
a thread. B's verdict ends early and the prog runs again for the rest.
B sends with its own reference to sk_redir.
