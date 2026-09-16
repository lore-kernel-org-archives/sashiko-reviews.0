Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D274E4332
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 18:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789584121; cv=none; b=gUcDpTTuQJRIa/rbFhOhTPEoggSu+VYBlnNDaqu99vIIL5NMWPRPP1m1IHBSCJ9VvBDNp1keS3/tyXey3LRlg7tjMUTnh9QaLEC3wivJ0xRj12JbFYa8gtX9d7u2kq7cYSgBLRtnNj0OnK2dQwmGkp1shNsy6ge1CDWkBlyFkic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789584121; c=relaxed/simple;
	bh=3fViUkPJ5R4pqZ4tsyhRvt8PHfD5g5yJFO+soEWsKIs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=X0oxs7aDvyzgYn32TqGWityyq4E37VWPa/x3BXk3ZXBkSvHP2dewX1bTEFvQd0wP8ire7v6gvZ1OYpn2qZgGe1hgDtGC7VGi/nCO67APtc6vknljAGng8ast3g4eKaT3GP4O9dRg7+7c5W70hR/tw23PdietLDJkBzTEKBPHzlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=ntoJG0lE; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="ntoJG0lE"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so5916b3a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 11:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1789584098; x=1790188898; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a1HEw2KiY0p3aEPTqA+U7w///uMWZ5JDbZz23TPVtOE=;
        b=ntoJG0lEKh5LA6I49ymRl6B2yUs5oGdnXF7eWYRmpC0lM6aHS270AOi6ywUCQPBjJ/
         NVU/tkiK9H8v43MO3EbissKynf5NQDB3wAxz7fXcRBzDQKhQIWbttTcCQ9OtbQt5+unz
         Sta+yi22jG1tzUdPff0IeMTb/Qd7FgVo5Wset26NYiZBEJX5uINRYHj22j15hHDFM0f0
         hjL8w4vnDfUGzXbFZb1ARJWvjPAJnUDENunb3qM3bpy5l55HhRVGMlf64hAEHhl4iCeU
         zchl15LzCRrA7venmEcrLaihbmy9ToNec6hSJuxp2Vfzxp/lOplGk9ajB3tLAwQPYHHR
         Hvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789584098; x=1790188898;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1HEw2KiY0p3aEPTqA+U7w///uMWZ5JDbZz23TPVtOE=;
        b=petddrdx2h4xeijaDyWofs3MTh7K0Xz1lJYp+ga2vtEBbadYI9hjPdbCJS3sfSmpM3
         ZsfGqKI9fGbxoCC9dt3SjnT+W60JYhVmCmdkKl9nYPjssEcl2T6yQTAwJt+wDVizc4z7
         siKAXuSUmHUtHGfjREaUgmcj+gENEqUMvm11Px9Tpynul8aW9mjbTnmVxx/ZvVGTpq3a
         Zz71myk1Rj4yT1eg7SlFXU6CjlSxDrX21ciTE0eUnrbUm09oJgaDjPfuO4csqWEwoFFI
         EGZFpWLKBoEsYPC85lMfijgrRttZmOA4uswNjzcBzOxkAJFQVyPo/Up/fu9hRUjg80Lq
         YFHA==
X-Gm-Message-State: AFuF++kDq+ax+HJ4ot0wafVbZgp3wqYiIMzBeQ5GcuDzM9Q9R+gOsCAp
	f7dr9Zz1Fzj3QdHdk7/7uRd1aCRgEMUX9LXbb2BV52VJPdEKCAiZrwtXMW7QzSTpepLHlNpooRd
	Yo4Mm4H0=
X-Gm-Gg: AYBFou1o8wa3rxWMxAytpZWS8VtabWzyP4lW6XBmBipd5WcPCP3G7vdg73DCavFwrWp
	Ui2QNylBShog/TodKHUHuVYziOZlrwtEhTNPZb8hvccRZ/vuPQWrVrxTIjGTjNcGJzOLKw7egfV
	ZTclEBRHrzTdPcLkbvtb/wA3OcTc8FMFTS++A1WxyZH4EifDnnorucOoQ2mp3IDAK5knM9jDg7Z
	2KZh0emUsE5z78Hnk4c4/StzoVUjZb5+BLrr7aQCbSLFG/pqxZXl20qnPjwdTDxYHHUqFTLbEma
	Hbh13cBNEyxUiEVQKDkCK4oTAZMmatsab2MUX37ou0pod/btffmH4Aqyu1biUD9iPti3Ln9qg5K
	mCGh3fgZVtwAD4CmzMxhhoMSv0u8jKJnYYtqPzTu0RGtlf7SxCmFSWucEcVUBvrfX/MCeJdPPX0
	LsW0ecMPooqfja9YUfNZYoeyU31oYAqSaKUsn2J7TAsXrepr926ET/2FpWtVuVHksiPzPD+L18P
	2s5O7gMidU4zgPU1KXGJqVIoodk
X-Received: by 2002:a05:6a21:6b05:b0:3d0:8abe:9e08 with SMTP id adf61e73a8af0-3dd5f4066e7mr10329013637.3.1789584098119;
        Wed, 16 Sep 2026 11:41:38 -0700 (PDT)
Received: from localhost (107-190-31-17.cpe.teksavvy.com. [107.190.31.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb30a3sm2029801a12.28.2026.09.16.11.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 11:41:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 18:41:36 +0000
Message-Id: <DLGYM8KB90NB.1X7S5GYGB1MWJ@etsalapatis.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf 09/11] bpf: Track whether dynptr type is known
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: <sashiko-reviews@lists.linux.dev>, "Emil Tsalapatis"
 <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0
References: <20260916050830.8774-1-emil@etsalapatis.com>
 <20260916050830.8774-10-emil@etsalapatis.com>
 <20260916052228.CFE9F1F000FF@smtp.kernel.org>
In-Reply-To: <20260916052228.CFE9F1F000FF@smtp.kernel.org>

On Wed Sep 16, 2026 at 5:22 AM UTC, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] bpf: missing type_unknown check in stacksafe() allows unsafe pru=
ning
> --
>
> commit 8f00e7cb51fcf9e4513f3c3e9be943021ba739cf
> Author: Emil Tsalapatis <emil@etsalapatis.com>
>
> bpf: Track whether dynptr type is known
>
> This commit adds a type_unknown field to struct bpf_reg_state's dynptr
> state to distinguish locally created dynptrs from global subprog argument=
s.
> It updates the verifier to set this flag, preparing for proper invalidati=
on
> of unknown dynptrs in subsequent commits.
>
>> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
>> index d5b4ab0bacd35..76aa724de1bcb 100644
>> --- a/include/linux/bpf_verifier.h
>> +++ b/include/linux/bpf_verifier.h
>> @@ -71,6 +71,7 @@ struct bpf_reg_state {
>>  		/* For dynptr stack slots */
>>  		struct {
>>  			enum bpf_dynptr_type type;
>> +			bool type_unknown;
>
> [Severity: High]
> Does this new field also need to be checked in stacksafe() when comparing
> states?
>
> Looking at stacksafe() in kernel/bpf/states.c, the STACK_DYNPTR case comp=
ares
> type, first_slot, id, and parent_id, but it omits the new type_unknown fi=
eld:
>
> kernel/bpf/states.c:stacksafe() {
>     ...
> 		case STACK_DYNPTR:
> 			old_reg =3D &old->stack[spi].spilled_ptr;
> 			cur_reg =3D &cur->stack[spi].spilled_ptr;
> 			if (old_reg->dynptr.type !=3D cur_reg->dynptr.type ||
> 			    old_reg->dynptr.first_slot !=3D cur_reg->dynptr.first_slot ||
> 			    !check_ids(old_reg->id, cur_reg->id, idmap) ||
> 			    !check_ids(old_reg->parent_id, cur_reg->parent_id, idmap))
> 				return false;
> 			break;
>     ...
> }
>
> If a BPF program conditionally spills a locally created dynptr
> (type_unknown=3Dfalse) or an unknown argument dynptr (type_unknown=3Dtrue=
) to
> the same stack slot, could the verifier incorrectly treat the states as
> equivalent and prune the unknown dynptr path? This might allow bypassing
> the packet pointer invalidation logic when writing to unknown dynptrs,
> potentially leading to a use-after-free of packet pointers.

Bot is right, will update accordingly.

>
>>  			/* A dynptr is 16 bytes so it takes up 2 stack slots.
>>  			 * We need to track which slot is the first slot
>>  			 * to protect against cases where the user may try to

