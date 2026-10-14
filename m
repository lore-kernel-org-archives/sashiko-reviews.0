Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB923A83BF
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 20:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008717; cv=none; b=peQmQJS/hLKn0rrq8TPLuJPX1y1SUAz1ymA/Hf5DDgT9UPB10BSoUaHVRtiFNNfg2iOG/eRSZIHG7Nale3RP2O/jSf2i1mz2GXOKvr8gO7XQJLtj/EPVUFRFnPSbU3xKth0XC+lhLJLxLUlO2SviBrK8emCJ5aPTWto9awxI62s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008717; c=relaxed/simple;
	bh=S8jHugwfc5mGzTXcxYeryvcS4QP8GMhXuGrtWSeI97U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=sxc3P7K1ZedC5IifuLrZQ9+pt6/WB0IAOmtpaz3D67MGzLA5OI6l/0YMlqRDD1Tc1YV/TDocrn1ryt71GCZuprOd/BKLpmbWonUZB+pcgZn55QFSZexf2YUPbKeBvByILbLDiLJi2gPYliqYdeQwXCgf8mIRr9/oHccK4xs48WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kg15kc6G; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kg15kc6G"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c37b612635bso221179866b.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 13:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792008714; x=1792613514; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B3NN1XmnvWDLl28EZgPw9HFna8foW+yV6qgfgucgqcE=;
        b=kg15kc6GGz52y2S7iHuSNbb/UFTqLWz+aQ0f9NIitgBMnfQgWdp0MicbxMUkL4oJiV
         pbfFZnMRadVXF/H0Kxmx20m1StK703RXIfiP1Tsd8ZHTYR9XQo0Gc7onDKyTfRPc13cz
         Lr7fmvrs9XblQNLMfvnUbw6EGML6Ayz0DpQ97MjvNy7MhBAzctbr1IUyHAN3bTp8mb7D
         qGQkH47GlXxRbcYVEc4Ab5Vzqq0M/KD6plGuiegrY0bJaWkz/hjC//n3VM4i1u8fnIZx
         e2y+NMeXh8zmKNzEhrpjNIdwmw3XEDVwfhRFEYEPj6h8xU+8uB6ulWbZdLKQiCwT/OVZ
         a7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792008714; x=1792613514;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3NN1XmnvWDLl28EZgPw9HFna8foW+yV6qgfgucgqcE=;
        b=km0tkxXKvU2TOHc+f7lMa8ZpmJSOsx+G6jf7WJehiMiLhYe2efw99Oj76sAydrJhNz
         Sc0lZYe4UkqwNrPu7NxldVT9ojIKXiGlS+CDxpYPgq2yvQtw0Zacw21TMk7Ui5YJ3LXM
         16ViiRGU7NsD1C9WmD6xHLUwndYHgqI2LxYELSS+N/6mEmjtOI8C86h6DnfZuUIr2Ix6
         b6hW+rHDsH06tId/ilAjfu6j7+Mbm1EYBC0eTUWELNEIBypr2keHXc65J36XQnZWOzDy
         HEZFBwEcghcux0JjW5yIdCjKThWAbnW+OAjM5DGBHu19qIznrTSYsZRPzGZXsg91GKiK
         gFUw==
X-Gm-Message-State: AFq9FYI7jdw2PdmRtv5pUgrYsXBVDZSThq7L4rA1NXzcMKvmxOoxNSBJ
	6pz1MngVTZrzs3MGvu37tbmvNlU0QGonc6GLsdOblaoRNg6u1NqYO8JmwtqYS6tR
X-Gm-Gg: AYBFou0go1O8c0G3vWoKmfUM52vHHQcIIvOHGbr1TIvm+s6CMtd4H1o1x4ADJ/NFlBf
	7Z+IlbPYvxNzDukwEUpCyd9hOCfG6nK3kp06XSZ9+PYKEdDwb6W8cfcKqmgOfrXYZfr2jPGGYIo
	iuuqZ4rn7xhYXMXp4Ovx0aiFgra+K9c/4XvO1jWRN7ZQkH/VU9wkKw3Cqd0fX3vGhCZ+URwEfnk
	iz/c+/oALsmi1iTHTh88hdPZyNkezMeDOcY7hooBfuYqQGGm9J2r+MzJe340qD1GP3hEBDmdYZn
	v4YeeeQ2Uv5oXlzBxdwUW9e0114FcvRrweEYKTGbO/NZBQ+hVEsBocXIL5Eji0+2t1Y3QEeUYag
	eWhVSuSUc7yLHDhHvdxE/AcIa5eWDu1yN/QnRx6zdJdYTFIObnAKDi/PjF9f3JpLq4wBmO+qxas
	yVXtVV95v6ocsw+0WdWok8enMt6gPolwo1PYt84PukD3DGGgEmAWvcedGTkqPQKI3z+R2ICbVvm
	1C7YVT8X7C9OA==
X-Received: by 2002:a17:906:ba8c:b0:c29:cfce:1946 with SMTP id a640c23a62f3a-c31a9b0d1ebmr1511912966b.15.1792008713693;
        Wed, 14 Oct 2026 13:11:53 -0700 (PDT)
Received: from localhost ([2001:4bb8:148:f08c:b8ea:248e:71e0:692c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda042c0csm24638166b.50.2026.10.14.13.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 13:11:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Oct 2026 22:11:51 +0200
Message-Id: <DM4U2L9VCAD7.2DJ6C8P1LAR8@gmail.com>
Subject: Re: [PATCH v3 02/11] hwmon: chipcap2: fix off-by-one in command
 mode retry loop
Cc: <linux-hwmon@vger.kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
 <20261014-chipcap2_locks-v3-2-27ebfc2c5b9e@gmail.com>
 <sashiko-outbox-171645@kernel.org>
In-Reply-To: <sashiko-outbox-171645@kernel.org>

On Wed Oct 14, 2026 at 8:01 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] hwmon: chipcap2: premature timeout due to 1-jiffy wait_for_compl=
etion_timeout
> --
>
> commit 529f4f489744495e9cdde8072b4894cc25895048
> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> hwmon: chipcap2: fix off-by-one in command mode retry loop
>
> i =3D=3D CC2_CM_RETRIES can never be true inside the loop, since it
> only runs while i < CC2_CM_RETRIES. Use CC2_CM_RETRIES - 1 so the
> last failed retry breaks out immediately instead of doing a useless
> disable + 80 ms power-cycle delay before the loop condition ends it
> anyway.
>
>> diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
>> index 8550578928523..8102b6851d3d1 100644
>> --- a/drivers/hwmon/chipcap2.c
>> +++ b/drivers/hwmon/chipcap2.c
>> @@ -226,7 +226,7 @@ static int cc2_command_mode_start(struct cc2_data *d=
ata)
>>  				     2 * CC2_RESP_START_CM_US);
>>  		}
>>  		ret =3D cc2_read_command_status(data->client);
>> -		if (ret !=3D -ETIMEDOUT || i =3D=3D CC2_CM_RETRIES)
>> +		if (ret !=3D -ETIMEDOUT || i =3D=3D CC2_CM_RETRIES - 1)
>
> [Severity: High]
> Can this still cause premature timeouts during device initialization and =
reads?
>
> Looking at cc2_command_mode_start() just above this check, the timeout
> calculation evaluates to exactly 1 jiffy on standard HZ configurations
> (e.g., HZ=3D100 or HZ=3D250), because 200 microseconds is significantly l=
ess
> than one tick:
>
> 	timeout =3D usecs_to_jiffies(2 * CC2_RESP_START_CM_US);
> 	ret =3D wait_for_completion_timeout(&data->complete, timeout);
>
> When a 1-jiffy timeout is passed to wait_for_completion_timeout(), it can
> expire almost instantly if the next timer interrupt occurs immediately af=
ter
> the call.
>
> This can cause the driver to prematurely abort the device initialization
> without triggering a retry, returning -ETIMEDOUT sporadically. This leads
> to random failures in device communication and user-space reads even if
> the device properly signals completion within its 100-microsecond window.
>
> This same 1-jiffy timeout issue also affects the EEPROM read sequence in
> cc2_read_reg():
>
> 	timeout =3D usecs_to_jiffies(2 * CC2_RESP_EEPROM_R_US);
> 	ret =3D wait_for_completion_timeout(&data->complete, timeout);
>
>>  			break;
>>
>>  		/* command window missed, prepare for a retry */

This is a separate issue from what the patch addresses, which is the
off-by-one error in the retry loop, but it makes sense.

I have never observed a timeout during communication with the device,
but statistically, this seems plausible given the conversion from
microseconds to jiffies.

The most sensible approach would be to send a follow-up patch that
ensures the timeout is at least 2 jiffies, regardless of the HZ
configuration, using something like:

timeout =3D max(usecs_to_jiffies(2 * CC2_RESP_START_CM_US), 2UL);

The same change would apply to the EEPROM read timeout in cc2_read_reg().

Best regards,
Javier
